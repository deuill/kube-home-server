FROM php:7.4.4-fpm
ARG VERSION=7.4.4

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    libcurl3-openssl-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev libtidy-dev \
    libonig-dev libzip-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd bcmath gettext mbstring mysqli pdo_mysql \
    session simplexml tidy tokenizer zip

EXPOSE 9000
CMD ["php-fpm"]
