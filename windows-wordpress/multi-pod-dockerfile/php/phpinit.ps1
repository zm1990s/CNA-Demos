(Get-Content C:\tools\nginx-1.17.10\html\wordpress\wp-config.php).replace('wordpresspassword', "$env:DBPASSWORD") | Set-Content C:\tools\nginx-1.17.10\html\wordpress\wp-config.php
(Get-Content C:\tools\nginx-1.17.10\html\wordpress\wp-config.php).replace('wordpress-mysql-svc', "$env:DBHOST") | Set-Content C:\tools\nginx-1.17.10\html\wordpress\wp-config.php

(Get-Content C:\tools\php74\php.ini).replace('wordpress-mysql-svc', "$env:DBHOST") | Set-Content C:\tools\php74\php.ini
(Get-Content C:\tools\php74\php.ini).replace('wordpresspassword', "$env:DBPASSWORD") | Set-Content C:\tools\php74\php.ini
C:\tools\php74\php-cgi.exe -b :9000