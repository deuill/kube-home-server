FROM redis:4.0-alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update

EXPOSE 6379
CMD ["redis-server"]
