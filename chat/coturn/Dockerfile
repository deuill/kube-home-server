FROM debian:stable-slim
ARG VERSION=4.5.1.1

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends coturn=${VERSION}* gettext sudo \
    ssl-cert ca-certificates

COPY docker/conf /etc
COPY docker/run-coturn /run-coturn

# STUN/TURN ports
EXPOSE 3478 3478/udp 5349 5349/udp

# Alternative STUN/TURN ports
EXPOSE 3479 3479/udp 5350 5350/udp

# Relay ports
EXPOSE 27000-27016/udp

ENTRYPOINT ["/run-coturn"]
