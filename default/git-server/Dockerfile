FROM debian:stable-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends git openssh-server ca-certificates

RUN mkdir -p /var/run/sshd

COPY docker/conf /etc/ssh
ADD docker/run-git-server /run-git-server

EXPOSE 22
CMD ["/run-git-server"]
