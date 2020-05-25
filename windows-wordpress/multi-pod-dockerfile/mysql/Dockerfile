FROM mcr.microsoft.com/windows/servercore:ltsc2019


COPY mysqlinit.bat mysqlinit-2.bat mysqlinit.ps1 "C:/"


RUN powershell -command Set-ExecutionPolicy Bypass -Scope Process -Force; \
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) ; \
choco install -y mysql; \
c:\mysqlinit.bat ; ls 


CMD powershell -command  c:\mysqlinit.ps1 ; pause