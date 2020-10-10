FROM debian:stable-slim
ARG VERSION=2.0.13

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates curl gnupg apt-transport-https

RUN echo "deb https://packages.spectrum.im/spectrum2/ buster main" > /etc/apt/sources.list.d/spectrum2.list && \
    echo "deb-src https://packages.spectrum.im/spectrum2/ buster main" >> /etc/apt/sources.list.d/spectrum2.list && \
    curl -o - https://packages.spectrum.im/packages.key | apt-key add - && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends sudo gettext spectrum2=1:${VERSION}"*" spectrum2-backend-libpurple=1:${VERSION}"*"

RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false curl gnupg apt-transport-https

ENV BUILD_DEPS="build-essential git libpurple-dev libglib2.0-dev libjson-glib-dev libhttp-parser-dev graphicsmagick-imagemagick-compat"
RUN apt-get install -y --no-install-recommends libjson-glib-1.0-0 ${BUILD_DEPS}

RUN git clone https://github.com/EionRobb/skype4pidgin.git && cd skype4pidgin/skypeweb && make && make install && rm -Rf /skype4pidgin
RUN git clone https://github.com/dylex/slack-libpurple.git && cd slack-libpurple && git checkout 2e9fa02 && make && make install && rm -Rf /slack-libpurple
RUN git clone https://github.com/EionRobb/purple-discord.git && cd purple-discord && git checkout 8fe9dca && make && make install && rm -Rf /purple-discord
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false ${BUILD_DEPS}

COPY docker/conf /etc/spectrum2
COPY docker/run-spectrum /run-spectrum

ENTRYPOINT ["/run-spectrum"]
