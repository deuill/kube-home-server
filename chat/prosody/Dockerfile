FROM debian:stable-slim
ARG VERSION=0.11.7

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl mercurial gnupg ca-certificates apt-transport-https

RUN echo "deb https://packages.prosody.im/debian stable main" > /etc/apt/sources.list.d/prosody.list && \
    echo "deb-src https://packages.prosody.im/debian stable main" >> /etc/apt/sources.list.d/prosody.list && \
    curl -o - https://prosody.im/files/prosody-debian-packages.key | apt-key add - && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends lua-dbi-mysql lua-event lua-zlib lua-sec lua-bitop prosody=${VERSION}*

RUN mkdir -p /usr/lib/prosody/community-modules && \
    hg clone https://hg.prosody.im/prosody-modules /usr/lib/prosody/community-modules

COPY docker/conf /etc/prosody
RUN prosodyctl check config

USER prosody
EXPOSE 5222 5269 5280 5347

ENV __FLUSH_LOG yes
ENTRYPOINT ["prosody"]
