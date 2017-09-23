FROM alpine:3.5

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update && \
	apk add postfix gettext

COPY conf /etc/postfix
ADD run-postfix /run-postfix

EXPOSE 25 587
ENTRYPOINT ["/run-postfix"]
