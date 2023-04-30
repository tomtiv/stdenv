#!/bin/sh
############
# Settings #
############

# This is a little script I've been using for a rather long time without any problem so I'm comfortable sharing it with others.
# What it does is use rsync to perform backup of some folders (configurable) from on one drive to the other. Wait, there's more.
# The backups are incremental, and it keeps the last 7 (configurable) backups. It uses rysnc's hard linking feature to to keep these backups at very little storage cost.
# But that's not all: When the backup (or maybe snapshot is a better term) is complete it emails me a log of what it has done.
# CI also use a similar script to backup from a PC by installing rsync server on the PC and pulling the data from the PC. I strongly recommend cwRsync over DeltaCopy for that, as it correctly handles unicode characters in file names.
# Just tweak the settings to match your personal preference and add a cron job that'll run it at regular intervals.


# rsync -avPz -e 'ssh -p 22' /src/ tt@`192.168.0.`:/path/to/dst
rsync -avPz -e 'ssh -p 1112' /opt/ tt@192.168.0.5:/NetBackup/dietpi/


# Set source and exclude rules to govern what should be backed-up.
srcPaths="/mnt/sda2/Photos /mnt/sda2/Documents /mnt/sda2/Downloads"
excludeRules="--exclude=/Downloads/incomplete/**"

# Set destination path, i.e. where should the backup be placed.
dstBasePath="/mnt/sdb2/Backup_NAS"

rsyncOpts="-ahHix --fuzzy --stats"

# What is the maximum number of complete backups to keep. If there are more,
# the oldest will be deleted.
maxSnapshotCount=7

# A command to-be executed after the backup operation is done. You can use the
# following variables in the command:
#  RSYNC_EXIT_CODE  - The return code of rsync. Zero means success.
#  LOG_FILE         - The full-path to the log file.
#  DESTINATION_PATH - The full-path to the backup directory.
postBackupCmd=''

# email settings
emailJobName="nas snapshot"
emailSendFrom="DNS-323 <Send...@Email.Address>"
emailSendTo="Sen...@Email.Address"

###################
# Run Environment #
###################

tmpPath=/tmp


#
# Backup locations and file names
#
currentLinkName="current"
logFileName="snapshot.log"
failedBackupSufix="incomplete"

dstName=$(date "+%Y%m%d_%H%M%S")
dstPath="${dstBasePath}/${dstName}"
dstLog="${dstPath}/${logFileName}"
currLink="${dstBasePath}/${currentLinkName}"

snapshotScriptName="$(basename ${0})"
lockFile="${tmpPath}/${snapshotScriptName}.lock"

##################################
# Make sure script isn't running #
##################################
if [ -e ${lockFile} ]; then
        echo "${snapshotScriptName} is already running. If this is not true, delete ${lockFile} and try again."
        exit 0;
fi
touch ${lockFile}

##########
# Backup #
##########
mkdir -p ${dstPath}

echo "Executing rsync ${rsyncOpts} --link-dest=${currLink} ${excludeRules} ${srcPaths} ${dstPath}" >> "${dstLog}"
echo "== rsync log start ===================================" >> "${dstLog}"

eval rsync ${rsyncOpts} --link-dest="${currLink}" ${excludeRules} ${srcPaths} "${dstPath}" >> "${dstLog}" 2>&1
rsyncRC=$?

echo "== rsync log end =====================================" >> "${dstLog}"

# This touch is not redundant. When getting files from a remote rsync daemon I noticed it sometimes modified the time of the
# destination directory to a value in the past. This screwed with the removal of old backups
touch ${dstPath}

#######################
# Update Current Link #
#######################
if [ ${rsyncRC} -eq 0 ]; then
    rm "${currLink}"
    ln -s "${dstName}" "${currLink}"
else
    echo "Something went wrong during backup (rc=${rsyncRC}). Current won't be updated." >> "${dstLog}"

    # rename destination to mark it as an incomplete snapshot
    origDstPath=${dstPath}
    dstPath="${origDstPath}.${failedBackupSufix}"
    mv ${origDstPath} ${dstPath}
    dstLog="${dstPath}/${logFileName}"
fi

######################
# Remove Old Backups #
######################
cd ${dstBasePath}

# Count how many good backups there are
snapshotCount=$(ls -1Atr . | grep -v ${currentLinkName} | grep -v "${failedBackupSufix}" | wc -l)

if [ ${snapshotCount} -gt ${maxSnapshotCount} ]; then

    # Please note that the output from ls is sorted in the correct order
    snapshotRemoveCount=$(( ${snapshotCount} - ${maxSnapshotCount} ))

    # What the code below does is list all snapshots ordered by date, then grabs
    # the N oldest (=first) good snapsthos and all incomplete snapshots
    # leading to them, where N is the number of snapshots to-be removed
    snapshotRemove=$(ls -1Atr . | grep -v ${currentLinkName} | awk -v count=${snapshotRemoveCount} "! /${failedBackupSufix}/ { count--} {print} {if (count==0) exit 0};")

    echo "Removing the ${snapshotRemoveCount} oldest snapshot(s):" >> "${dstLog}"
    echo "${snapshotRemove}" >> "${dstLog}"
    rm -r ${snapshotRemove} >> "${dstLog}" 2>&1
else
    echo "Found ${snapshotCount} snapshot(s) where ${maxSnapshotCount} allowed. None removed." >> "${dstLog}"
fi

# Remove lock file
rm ${lockFile}

###########################
# Run Post Backup Command #
###########################
if [ -n "${postBackupCmd}" ]; then

    # Setup the post backup command run environment
    DESTINATION_PATH="${dstPath}"
    LOG_FILE="${dstLog}"
    RSYNC_EXIT_CODE="${rsyncRC}"

    echo "Executing ${postBackupCmd}" >> "${dstLog}"
    eval ${postBackupCmd}
fi

##############
# Send email #
##############
tmpEmailFile=${tmpPath}/${snapshotScriptName}_email.${$}

# Create the email
echo "Subject: ${emailJobName} completed result[${rsyncRC}]" > ${tmpEmailFile}
echo "From: ${emailSendFrom}" >> ${tmpEmailFile}
echo "To: ${emailSendTo}" >> ${tmpEmailFile}
echo "MIME-Version: 1.0" >> ${tmpEmailFile}
echo "Content-Type: multipart/mixed; boundary=\"2oS5YaxWCcQjTEyO\"" >> ${tmpEmailFile}
echo "Auto-Submitted: auto-generated" >> ${tmpEmailFile}
echo "" >> ${tmpEmailFile}
echo "--2oS5YaxWCcQjTEyO" >> ${tmpEmailFile}
echo "Content-Type: text/plain; charset=us-ascii" >> ${tmpEmailFile}
echo "Content-Disposition: inline" >> ${tmpEmailFile}
echo "" >> ${tmpEmailFile}
echo "Attached: snaptool log." >> ${tmpEmailFile}
echo "" >> ${tmpEmailFile}
echo "--2oS5YaxWCcQjTEyO" >> ${tmpEmailFile}
echo "Content-Type: text/plain; charset=us-ascii" >> ${tmpEmailFile}
echo "Content-Disposition: attachment; filename=\"${logFileName}\"" >> ${tmpEmailFile}
echo "" >> ${tmpEmailFile}
cat ${dstLog} >> ${tmpEmailFile}
echo "" >> ${tmpEmailFile}
echo "--2oS5YaxWCcQjTEyO--" >> ${tmpEmailFile}

# Send email
cat ${tmpEmailFile} | sendmail --read-recipients --read-envelope-from

# Cleanup
rm ${tmpEmailFile}


exit ${rsyncRC}