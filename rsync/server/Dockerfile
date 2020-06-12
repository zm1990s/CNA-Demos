FROM alpine:latest
RUN apk add rsync
COPY rsyncd.conf rsyncd.motd rsyncd.secrets /etc/
COPY docker-entrypoint.sh /
WORKDIR /
CMD /docker-entrypoint.sh
