FROM alpine:3.7

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update && \
	apk add postfix postfix-mysql gettext ca-certificates

COPY docker/conf /etc/postfix
ADD docker/run-postfix /run-postfix

EXPOSE 25 465 587
ENTRYPOINT ["/run-postfix"]
