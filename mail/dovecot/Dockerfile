FROM debian:stable-slim
ARG VERSION=2.2.27

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    dovecot-imapd=1:${VERSION}* dovecot-lmtpd=1:${VERSION}* dovecot-mysql=1:${VERSION}* \
    dovecot-sieve=1:${VERSION}* dovecot-managesieved=1:${VERSION}* \
    gettext ca-certificates

COPY docker/conf /etc/dovecot
COPY docker/run-dovecot /run-dovecot

EXPOSE 143 993 3659
ENTRYPOINT ["/run-dovecot"]
