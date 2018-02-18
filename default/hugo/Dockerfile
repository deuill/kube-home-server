FROM alpine:3.7

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update && \
	apk add curl

ENV HUGO_VERSION=0.36.1
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | \
    tar -xzf - hugo -C /usr/local/bin

ENV HUGO_SOURCE /hugo/source
ENV HUGO_BUILD /hugo/build

ADD docker/run-hugo /run-hugo
ENTRYPOINT ["/run-hugo"]

CMD ["--source=${HUGO_SOURCE}", "--destination=${HUGO_BUILD}"]
