FROM debian:stable-slim
ARG VERSION=8.3

ENV BUILD_DEPS="build-essential git cmake python"
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
            libexpat1-dev libidn11-dev uuid-dev libsqlite3-dev libudns-dev sudo gettext ca-certificates \
            ${BUILD_DEPS}

RUN git clone https://github.com/randombit/botan.git /botan && cd botan && \
    python2 configure.py --prefix=/usr && make && make install && rm -Rf /botan

RUN git clone --branch ${VERSION} --depth 1 git://git.louiz.org/biboumi /biboumi && \
    mkdir /biboumi/build && cd /biboumi/build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DWITH_BOTAN=1 -DWITH_SQLITE3=1 \
             -DWITH_LIBIDN=1 -DWITHOUT_SYSTEMD=1 && \
    make && make install && rm -Rf /biboumi

RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false ${BUILD_DEPS}

COPY docker/conf /etc/biboumi
COPY docker/run-biboumi /run-biboumi

ENTRYPOINT ["/run-biboumi"]
