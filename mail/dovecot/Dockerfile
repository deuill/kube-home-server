FROM alpine:3.5

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update && \
	apk add dovecot dovecot-mysql dovecot-pigeonhole-plugin gettext

COPY docker/conf /etc/dovecot
ADD docker/run-dovecot /run-dovecot

EXPOSE 143 3659
ENTRYPOINT ["/run-dovecot"]
