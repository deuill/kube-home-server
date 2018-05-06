FROM debian:stable-slim
ARG VERSION=1.6.5

ENV BUILD_DEPS="build-essential git znc-dev"
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends znc=${VERSION}* gettext sudo ca-certificates ${BUILD_DEPS}

RUN git clone https://github.com/CyberShadow/znc-clientbuffer.git && make -C znc-clientbuffer install && rm -Rf /znc-clientbuffer
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false ${BUILD_DEPS}

COPY docker/conf /etc/znc
EXPOSE 6667

COPY docker/run-znc /run-znc
ENTRYPOINT ["/run-znc"]
