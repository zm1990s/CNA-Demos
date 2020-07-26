FROM nextcloud:19
ADD nextcloud-plugin/*.tar.gz /usr/src/nextcloud/
COPY sources.list /etc/apt/sources.list
RUN  apt-get update && apt-get install -y apt-utils ffmpeg p7zip p7zip-full unrar
