(Get-Content c:\mysqlinit-2.bat).replace('wordpresspassword', "$env:DBPASSWORD") | Set-Content c:\mysqlinit-2.bat
c:\mysqlinit-2.bat