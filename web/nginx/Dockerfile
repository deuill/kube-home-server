FROM nginx:stable-alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories && \
    apk upgrade --no-cache --update

RUN rm -rf /etc/nginx
COPY docker/conf /etc/nginx
RUN nginx -t

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
