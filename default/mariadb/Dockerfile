FROM mariadb:10.4
ARG VERSION=10.4

RUN apt-get update && \
    apt-get install -y --no-install-recommends

EXPOSE 3306
CMD ["mysqld"]
