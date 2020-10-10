FROM debian:stable-slim
ARG VERSION=18.0.4

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl bzip2 ca-certificates

RUN curl -Lo - "https://download.nextcloud.com/server/releases/nextcloud-${VERSION}.tar.bz2" | tar xjf - -C /tmp && \
    rm -Rf /tmp/nextcloud/updater && mkdir -p /tmp/nextcloud/data && mkdir -p /tmp/nextcloud/custom_apps && \
    chown -R www-data:www-data /tmp/nextcloud && \
    mkdir -p /srv/http/nextcloud

COPY docker/conf /tmp/nextcloud/config
CMD cp -af /tmp/nextcloud/. /srv/http/nextcloud
