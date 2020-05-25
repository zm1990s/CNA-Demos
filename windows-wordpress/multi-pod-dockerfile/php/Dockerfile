
FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY wordpress.zip phpinit.ps1 "C:/"

RUN powershell -command Set-ExecutionPolicy Bypass -Scope Process -Force; \
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) ; \
choco install -y php; mkdir -p "C:/tools/nginx-1.17.10/html/"  ; Expand-Archive -Path c:\wordpress.zip -DestinationPath "C:\tools\nginx-1.17.10\html"

COPY php.ini "C:/tools/php74/"
COPY wp-config.php "C:/tools/nginx-1.17.10/html/wordpress/"


CMD powershell -command c:\phpinit.ps1
