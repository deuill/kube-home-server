FROM debian:stable-slim
ARG VERSION=1.0.0

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends git openssh-client ca-certificates

ADD docker/git-fetch /git-fetch
ENTRYPOINT ["/git-fetch"]
