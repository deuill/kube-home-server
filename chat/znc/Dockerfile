FROM debian:stable-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends znc gettext sudo

COPY docker/conf /etc/znc
EXPOSE 6667

COPY docker/run-znc /run-znc
ENTRYPOINT ["/run-znc"]
