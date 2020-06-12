#!/bin/sh
sed -i 's#/backup/#'${backup_path}'#' /etc/rsyncd.conf
sed -i 's/BACKUPUSER/'${username}'/' /etc/rsyncd.conf
echo ${username}:${password}>/etc/rsyncd.secrets
chmod 600 /etc/rsyncd.secrets
touch /var/log/rsyncd.log
rsync --daemon && tail -f /var/log/rsyncd.log
