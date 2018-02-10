FROM debian:stretch

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl gnupg

RUN echo "deb http://rspamd.com/apt-stable/ stretch main" > /etc/apt/sources.list.d/rspamd.list && \
    echo "deb-src http://rspamd.com/apt-stable/ stretch main" >> /etc/apt/sources.list.d/rspamd.list && \
    curl -o - http://rspamd.com/apt-stable/gpg.key | apt-key add - && \
    apt-get update && \
    apt-get install -y --no-install-recommends rspamd

COPY docker/conf /etc/rspamd
EXPOSE 11332 11333 11334

ADD docker/run-rspamd /run-rspamd
ENTRYPOINT ["/run-rspamd"]
