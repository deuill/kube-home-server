FROM debian:stable-slim
ARG VERSION=0.54.0

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl sudo ca-certificates

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz | \
    tar -C /usr/local/bin -xzvf - hugo && \
    chmod +x /usr/local/bin/hugo

ADD docker/run-hugo /run-hugo
ENTRYPOINT ["/run-hugo"]
