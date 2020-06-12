#!/bin/sh
echo "-----------------------------------"
echo "Backup job starting..."
echo "Current date: `date`"
rsync  -avz --password-file=/root/passwd  "$backup_path"   "$username"@"$rsync_server"::"$dstconfig"
