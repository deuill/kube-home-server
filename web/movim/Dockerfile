FROM debian:stable-slim
ARG VERSION=0.17

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl bzip2 ca-certificates php-composer

ENV MOVIM_INSTALL /srv/http/movim

RUN curl -Lo - "https://github.com/movim/movim/archive/v${VERSION}.tar.gz" | tar xjf - -C /tmp && \
    cd /tmp/movim-${VERSION} && composer install --no-suggest --optimize-autoloader && \
    chown -R www-data:www-data /tmp/movim-${VERSION} && \
    mkdir -p "${MOVIM_INSTALL}"

COPY docker/conf /tmp/movim/config
COPY docker/run-movim /

CMD cp -af /tmp/movim/. "${MOVIM_INSTALL}"
USER www-data

ENTRYPOINT ["/run-movim"]
