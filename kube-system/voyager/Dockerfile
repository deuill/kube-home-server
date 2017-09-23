FROM alpine:3.7

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update && \
    apk add go git libc-dev

ENV SOURCE_URI=https://github.com/appscode/voyager.git \
    BRANCH=master VERSION=5.0.0-rc.11

ENV BUILD_BASE=/tmp/build PACKAGE=github.com/appscode/voyager

RUN \
    # Set up directory structure and GOPATH.
    export GOPATH=${BUILD_BASE}/go && mkdir -p ${BUILD_BASE}/go && \

    # Fetch Voyager source and install dependency manager.
    git clone --no-checkout -b ${BRANCH} ${SOURCE_URI} ${BUILD_BASE}/go/src/${PACKAGE} && \

    # Install dependencies and build certificate manager.
    cd ${BUILD_BASE}/go/src/${PACKAGE} && \

    git fetch --tags origin ${BRANCH} && \
    git reset --hard ${VERSION} && go build -o /usr/bin/voyager . && \

    # Copy additional required files.
    mkdir -p /srv/voyager && cp -Rf hack/docker/voyager/templates /srv/voyager && \

    # Clean up build files.
    cd /tmp && rm -Rf ${BUILD_BASE} && \
    apk del go git libc-dev

ENTRYPOINT ["/usr/bin/voyager"]
