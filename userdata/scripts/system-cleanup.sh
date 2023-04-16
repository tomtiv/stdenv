#!/bin/bash

sudo apt-get autoremove
sudo du -sh /var/cache/apt 
sudo apt-get autoclean
sudo apt-get clean
journalctl --disk-usage
sudo journalctl --vacuum-time=1h
du -h /var/lib/snapd/snaps

# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

du -h /var/lib/snapd/snaps

du -sh ~/.cache/thumbnails
rm -rf ~/.cache/thumbnails/*

# Remove kernal
#sudo dpkg --list 'linux-image*'
# Note: Replace VERSION with the version of the kernel you want to remove.
#sudo apt-get remove linux-image-VERSION

# make script executable
#chmod u+x script.sh


# list partitions
# lsblk 

#sudo apt install deborphan gtkorphan
# sudo apt install fdupes

## Once installed, you can search duplicate files using the below command:
# fdupes /path/to/folder

## For recursively searching within a folder, use -r option
#fdupes -r /home

## This will only list the duplicate files and do not delete them by itself. You can manually delete the duplicate files or use -d option to delete them.
# fdupes -d /path/to/folder
## This won’t delete anything on its own but will display all the duplicate files and gives you an option to either delete files one by one or select a range to delete it. If you want to delete all files without asking and preserving the first one, you can use the noprompt -N option