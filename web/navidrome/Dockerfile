FROM debian:stable-slim
ARG VERSION=0.31.0

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl sudo ca-certificates ffmpeg

RUN curl -L https://github.com/deluan/navidrome/releases/download/v${VERSION}/navidrome_${VERSION}_Linux_x86_64.tar.gz | \
    tar -C /usr/local/bin -xzvf - navidrome && \
    chmod +x /usr/local/bin/navidrome

COPY docker/conf /etc/navidrome

RUN groupadd -r navidrome
RUN useradd -rg navidrome -d /var/lib/navidrome navidrome
USER navidrome

ENTRYPOINT ["/usr/local/bin/navidrome", "--configfile", "/etc/navidrome/navidrome.toml"]
