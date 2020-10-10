FROM nginx:1.17
ARG VERSION=1.17

RUN apt-get update -y && apt-get upgrade -y

RUN rm -rf /etc/nginx
COPY docker/conf /etc/nginx
RUN nginx -t

# Forward request logs to Docker log collector.
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
