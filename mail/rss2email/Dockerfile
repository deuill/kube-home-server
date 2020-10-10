FROM debian:stable-slim
ARG VERSION=v3.12.1

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends git ca-certificates gettext \
        python3 python3-setuptools python3-feedparser python3-html2text python3-bs4

RUN git clone git://github.com/rss2email/rss2email.git /tmp/rss2email && \
    cd /tmp/rss2email && git reset --hard ${VERSION} && \
    python3 setup.py install && \
    rm -Rf /tmp/rss2email

COPY docker/run-rss2email /run-rss2email
ENTRYPOINT ["/run-rss2email"]
