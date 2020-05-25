FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY wordpress.zip nginxinit.ps1 "C:/"

RUN powershell -command Set-ExecutionPolicy Bypass -Scope Process -Force; \
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) ; \
choco install -y nginx ; \
Expand-Archive -Path c:\wordpress.zip -DestinationPath "C:\tools\nginx-1.17.10\html"


COPY wp-config.php "C:/tools/nginx-1.17.10/html/wordpress/"
COPY nginx.conf "C:/tools/nginx-1.17.10/conf/"

CMD powershell -command c:\nginxinit.ps1