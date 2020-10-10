FROM redis:5.0
ARG VERSION=5.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends

EXPOSE 6379
CMD ["redis-server"]
