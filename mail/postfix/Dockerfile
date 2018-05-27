FROM debian:stable
ARG VERSION=3.1.8

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
            postfix=${VERSION}* postfix-mysql=${VERSION}* syslog-ng-core gettext ca-certificates

COPY docker/conf /etc/postfix
COPY docker/run-postfix /run-postfix

EXPOSE 25 465 587
ENTRYPOINT ["/run-postfix"]
