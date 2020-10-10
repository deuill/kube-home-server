FROM debian:stable-slim
ARG VERSION=3.0.3

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends python3 python3-pip python3-setuptools gettext sudo

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install radicale==$VERSION https://github.com/Unrud/RadicaleIMAP/archive/master.tar.gz

COPY docker/conf /etc/radicale
COPY docker/run-radicale /run-radicale

EXPOSE 5232
ENTRYPOINT ["/run-radicale"]
