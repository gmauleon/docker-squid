FROM alpine:latest

MAINTAINER gael.mauleon@gmail.com

ENV SQUID_LOG_DIR /var/log/squid
ENV SQUID_CACHE_DIR /var/cache/squid

RUN apk update && apk add squid && rm -rf /var/cache/apk/*

COPY squid.conf /etc/squid/squid.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

EXPOSE 3128
USER squid

ENTRYPOINT ["./docker-entrypoint.sh"]
