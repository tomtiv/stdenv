#!/bin/bash

CURRENTDATE=`date +"%Y-%m-%d %T"`
DT=`date +"%Y-%m-%d_%h-%m"`

echo Current Date and Time is: ${CURRENTDATE}
echo DT is: ${DT}

# cd /mnt/c/gdrive/magicmirror-dev
cd /mnt/c/tdat-c/projects/magicmirror/mm42

sudo mkdir ${DT}
cd ${DT}

#ENV_VAL= ' -i /mnt/c/users/tomtiv/.ssh/mm_id_rsa'

sudo rsync -rlptzv --progress --delete --exclude=.git --exclude=node_modules "root@192.168.0.42:/mm/dev" .
sudo rsync -rlptzv --progress --delete --exclude=.git "root@192.168.0.42:/mm/css" .
sudo rsync -rlptzv --progress --delete --exclude=.git "root@192.168.0.42:/mm/js" .
sudo rsync -rlptzv --progress --delete --exclude=.git --exclude=node_modules "root@192.168.0.42:/mm/modules" .
sudo rsync -rlptzv --progress --delete --exclude=.git --exclude=node_modules "root@192.168.0.42:~/.pm2/logs" .

echo 'DONE!!'
