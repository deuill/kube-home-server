FROM debian:stable-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends git openssh-server ca-certificates

RUN mkdir -p /var/run/sshd
COPY conf /etc/ssh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
