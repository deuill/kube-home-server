FROM debian:stable-slim
ARG VERSION=3.5.1

ENV BUILD_DEPS="build-essential git curl libpurple-dev libglib2.0-dev libjson-glib-dev"
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends bitlbee-libpurple=${VERSION}* ca-certificates ${BUILD_DEPS}

RUN git clone https://github.com/dylex/slack-libpurple.git && cd slack-libpurple && make && make install
RUN git clone git://github.com/EionRobb/skype4pidgin.git && cd skype4pidgin/skypeweb && make && make install

RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false ${BUILD_DEPS}

COPY docker/conf /etc/bitlbee

EXPOSE 6667
USER bitlbee

CMD ["/usr/sbin/bitlbee", "-F", "-n"]
