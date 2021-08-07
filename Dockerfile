FROM alpine:3.12.0


# Set timezone to Europe/Prague
RUN apk --no-cache add tzdata \
	&& cp /usr/share/zoneinfo/Europe/Prague /etc/localtime \
	&& echo "Europe/Prague" > /etc/timezone \
	&& apk del tzdata \
	&& mkdir -p  /usr/share/zoneinfo/Europe \
	&& ln /etc/localtime /usr/share/zoneinfo/Europe/Prague


# Setup apache and php
# See - https://github.com/codecasts/php-alpine
ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# Install PHP
RUN echo "https://dl.bintray.com/php-alpine/v3.11/php-7.4" >> /etc/apk/repositories \
    && apk --no-cache add \
            ca-certificates \
            curl \
            apache2=2.4.43-r0 \
            php7-apache2=7.4.5-r1 \
            php7-bcmath=7.4.5-r1 \
            php7-exif=7.4.5-r1 \
            php7-json=7.4.5-r1 \
            php7-phar=7.4.5-r1 \
            php7-mbstring=7.4.5-r1 \
            php7-openssl=7.4.5-r1 \
            php7-opcache=7.4.5-r1 \
            php7-mysqli=7.4.5-r1 \
            php7-curl=7.4.5-r1 \
            php7-pdo_mysql=7.4.5-r1 \
            php7-ctype=7.4.5-r1 \
            php7-gd=7.4.5-r1 \
            php7-xml=7.4.5-r1 \
            php7-dom=7.4.5-r1 \
            php7-iconv=7.4.5-r1 \
            php7-zip=7.4.5-r1 \
            php7-zlib=7.4.5-r1 \
            composer=1.10.6-r0 \
    && ln -s /usr/bin/php7 /usr/bin/php


# Install MySQL Client
RUN apk --no-cache add \
        mysql-client=10.4.13-r0


# Install Node
RUN apk --no-cache add \
        nodejs=12.17.0-r0 \
        yarn=1.22.4-r0 \
        chromium=83.0.4103.61-r0

# Install zip/unzip
RUN apk --no-cache add \
        unzip-6.0-r9 \
        zip-3.0-r8

# Set CHROME_BIN environment variable - this is needed by Karma
ENV CHROME_BIN=/usr/bin/chromium-browser

USER root
