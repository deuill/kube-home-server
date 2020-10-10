FROM debian:stable-slim
ARG VERSION=3.5.1

ENV BUILD_DEPS="build-essential git curl libpurple-dev libglib2.0-dev libjson-glib-dev libhttp-parser-dev graphicsmagick-imagemagick-compat gettext"
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends bitlbee-libpurple=${VERSION}* ca-certificates

RUN apt-get install -y --no-install-recommends libjson-glib-1.0-0 ${BUILD_DEPS}
RUN git clone https://github.com/EionRobb/skype4pidgin.git && cd skype4pidgin/skypeweb && make && make install && rm -Rf /skype4pidgin
RUN git clone https://github.com/EionRobb/purple-discord.git && cd purple-discord && make && make install && rm -Rf /purple-discord
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false ${BUILD_DEPS}

COPY docker/conf /etc/bitlbee

EXPOSE 6667
USER bitlbee

CMD ["/usr/sbin/bitlbee", "-n", "-v"]
