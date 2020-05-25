C:\tools\mysql\mysql-8.0.20-winx64\bin\mysql.exe -uroot -p"Admin@123" -e  "CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpresspassword'"
C:\tools\mysql\mysql-8.0.20-winx64\bin\mysql.exe -uroot -p"Admin@123" -e  "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%'"
C:\tools\mysql\mysql-8.0.20-winx64\bin\mysql.exe -uroot -p"Admin@123" -e  "flush privileges"