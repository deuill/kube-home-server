FROM nginx:1.12.2
ARG VERSION=1.12.2

RUN apt-get update -y && apt-get upgrade -y

RUN rm -rf /etc/nginx
COPY docker/conf /etc/nginx
RUN nginx -t

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
