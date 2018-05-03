FROM debian:stable-slim
ARG VERSION=0.39

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl sudo ca-certificates

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz | \
    tar -xzf - hugo -C /usr/local/bin

ENV HUGO_SOURCE /hugo/source
ENV HUGO_BUILD /hugo/build

ADD docker/run-hugo /run-hugo
ENTRYPOINT ["/run-hugo"]

CMD ["--source=${HUGO_SOURCE}", "--destination=${HUGO_BUILD}"]
