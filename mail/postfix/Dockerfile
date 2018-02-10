FROM alpine:3.5

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update && \
	apk add postfix gettext

COPY docker/conf /etc/postfix
ADD docker/run-postfix /run-postfix

EXPOSE 25 587
ENTRYPOINT ["/run-postfix"]
