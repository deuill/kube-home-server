FROM php:7.2.4-fpm-stretch
ARG VERSION=7.2.4

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    libcurl3-openssl-dev libjpeg62-turbo-dev libpng-dev libxml2-dev libtidy-dev

RUN docker-php-ext-install \
    bcmath ctype curl dom gettext gd hash iconv json mbstring mysqli pdo_mysql session simplexml tidy \
    tokenizer zip

EXPOSE 9000
CMD ["php-fpm"]
