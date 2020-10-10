FROM debian:stable-slim
ARG VERSION=2.5

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl gnupg ca-certificates

RUN echo "deb https://rspamd.com/apt-stable/ buster main" > /etc/apt/sources.list.d/rspamd.list && \
    echo "deb-src https://rspamd.com/apt-stable/ buster main" >> /etc/apt/sources.list.d/rspamd.list && \
    curl -o - https://rspamd.com/apt-stable/gpg.key | apt-key add - && \
    apt-get update && apt-get install -y --no-install-recommends rspamd=${VERSION}"*"

COPY docker/conf /etc/rspamd
COPY docker/run-rspamd /run-rspamd

EXPOSE 11332 11333 11334
ENTRYPOINT ["/run-rspamd"]
