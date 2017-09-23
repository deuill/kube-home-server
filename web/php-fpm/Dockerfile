FROM php:fpm-alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update

EXPOSE 9000
CMD ["php-fpm"]
