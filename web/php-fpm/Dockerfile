FROM php:7.2.6-fpm-stretch
ARG VERSION=7.2.6

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    libcurl3-openssl-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev libtidy-dev

RUN docker-php-ext-install \
    bcmath ctype curl dom gettext hash iconv json mbstring mysqli pdo_mysql session simplexml tidy \
    tokenizer zip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

EXPOSE 9000
CMD ["php-fpm"]
