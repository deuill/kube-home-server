FROM debian:stable-slim
ARG VERSION=1.6.5

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends znc=${VERSION}* gettext sudo

COPY docker/conf /etc/znc
EXPOSE 6667

COPY docker/run-znc /run-znc
ENTRYPOINT ["/run-znc"]
