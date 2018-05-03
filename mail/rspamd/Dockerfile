FROM debian:stable-slim
ARG VERSION=1.7.3

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl gnupg

RUN echo "deb http://rspamd.com/apt-stable/ stretch main" > /etc/apt/sources.list.d/rspamd.list && \
    echo "deb-src http://rspamd.com/apt-stable/ stretch main" >> /etc/apt/sources.list.d/rspamd.list && \
    curl -o - http://rspamd.com/apt-stable/gpg.key | apt-key add - && \
    apt-get update && apt-get install -y --no-install-recommends rspamd=${VERSION}"*"

COPY docker/conf /etc/rspamd
COPY docker/run-rspamd /run-rspamd

EXPOSE 11332 11333 11334
ENTRYPOINT ["/run-rspamd"]
