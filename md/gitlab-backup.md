# BACKING UP GIT LAB


## Backup configs

/srv/gitlab/config
/etc/gitlab/gitlab-secrets.json
/etc/gitlab/gitlab.rb
/etc/gitlab/ssl
/etc/gitlab/trusted-certs

/secret/gitlab/backup
/var/opt/gitlab
/var/opt/gitlab/backups

## gitlab-backup

- Full Backup
docker exec -t gitlab gitlab-backup create

- Imcremental Backup
docker exec -t gitlab gitlab-backup create INCREMENTAL=yes PREVIOUS_BACKUP=<timestamp_of_backup>


docker exec -t <your container name> gitlab-backup

docker exec -t <your container name> /bin/sh -c 'gitlab-ctl backup-etc && cd /etc/gitlab/config_backup && cp $(ls -t | head -n1) /secret/gitlab/backups/'
z
