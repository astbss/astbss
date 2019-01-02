# docker build -f Dockerfile.13.24.1.php -t astbss/asterisk:13.24.1.php .
# docker run -it --name asterisk --rm astbss/asterisk:13.24.1.php
# docker run -it --rm astbss/asterisk:13.24.1.php


# vim:set ft=dockerfile:
# FROM debian:stretch-slim

FROM php:7.2-cli
LABEL maintainer="are@astbss.com"
ENV DEBIAN_FRONTEND noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
   
RUN docker-php-ext-install mysqli pdo pdo_mysql


# 13.24.1

ENV ASTERISK_VERSION 13.24.1
ENV OPUS_CODEC       asterisk-13.0/x86-64/codec_opus-13.0_current-x86_64

COPY build-asterisk.sh /
RUN /build-asterisk.sh
RUN mkdir -p /etc/asterisk

EXPOSE 5060/udp 5060/tcp
VOLUME /var/lib/asterisk/sounds /var/lib/asterisk/keys /var/lib/asterisk/phoneprov /var/spool/asterisk /var/log/asterisk

COPY debian-9/docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W", "-U", "asterisk", "-p"]