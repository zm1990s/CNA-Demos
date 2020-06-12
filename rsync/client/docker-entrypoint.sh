#!/bin/sh
echo "$crontab" > /etc/crontabs/root
echo  "$password"  >  /root/passwd
chmod  600  /root/passwd
crond
touch /var/log/rsync.log
tail -f /var/log/rsync.log
