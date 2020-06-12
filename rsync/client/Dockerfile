FROM alpine:latest
RUN apk add --no-cache rsync
COPY backup.sh docker-entrypoint.sh /
CMD  /docker-entrypoint.sh
