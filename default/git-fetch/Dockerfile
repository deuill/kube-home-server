FROM debian:stable-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends git openssh-client ca-certificates

ADD docker/git-fetch /git-fetch
ENTRYPOINT ["/git-fetch"]
