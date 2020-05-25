(Get-Content C:\tools\nginx-1.17.10\html\wordpress\wp-config.php).replace('wordpresspassword', "$env:DBPASSWORD") | Set-Content C:\tools\nginx-1.17.10\html\wordpress\wp-config.php
(Get-Content C:\tools\nginx-1.17.10\html\wordpress\wp-config.php).replace('wordpress-mysql-svc', "$env:DBHOST") | Set-Content C:\tools\nginx-1.17.10\html\wordpress\wp-config.php

stop-service nginx
(Get-Content C:\tools\nginx-1.17.10\conf\nginx.conf).replace('wordpress-php-svc', "$env:PHPHOST") | Set-Content C:\tools\nginx-1.17.10\conf\nginx.conf
start-service nginx

$logfile="C:\tools\nginx-1.17.10\logs\error.log"
 while ( $true ) {write-host checking nginx status ; $oldlogsize=(Get-Item $logfile).Length ; sleep 5 ; $newlogsize=(Get-Item $logfile).Length; if ($oldlogsize -eq $newlogsize){write-host "nginx is ok"} else {write-host "nginx might've failed,restarting"; restart-service nginx }}