FROM alpine:3.13.1


# Set timezone to Europe/Prague
RUN apk --no-cache add tzdata \
	&& cp /usr/share/zoneinfo/Europe/Prague /etc/localtime \
	&& echo "Europe/Prague" > /etc/timezone \
	&& apk del tzdata \
	&& mkdir -p  /usr/share/zoneinfo/Europe \
	&& ln /etc/localtime /usr/share/zoneinfo/Europe/Prague


# Setup apache and php
RUN apk --no-cache add \
            ca-certificates \
            curl \
            apache2=2.4.48-r0 \
            php7-apache2=7.4.21-r0 \
            php7-bcmath=7.4.21-r0 \
            php7-exif=7.4.21-r0 \
            php7-json=7.4.21-r0 \
            php7-phar=7.4.21-r0 \
            php7-mbstring=7.4.21-r0 \
            php7-openssl=7.4.21-r0 \
            php7-opcache=7.4.21-r0 \
            php7-mysqli=7.4.21-r0 \
            php7-curl=7.4.21-r0 \
            php7-pdo_mysql=7.4.21-r0 \
            php7-ctype=7.4.21-r0 \
            php7-gd=7.4.21-r0 \
            php7-xml=7.4.21-r0 \
            php7-dom=7.4.21-r0 \
            php7-iconv=7.4.21-r0 \
            php7-zip=7.4.21-r0 \
            php7-session=7.4.21-r0 \
            composer=2.0.13-r0

# Install MySQL Client
RUN apk --no-cache add \
        mariadb-client=10.5.11-r0


# Install Node
RUN apk --no-cache add \
        nodejs=14.17.4-r0 \
        yarn=1.22.10-r0 \
        chromium=86.0.4240.111-r0

# Install zip/unzip
RUN apk --no-cache add \
        unzip=6.0-r9 \
        zip=3.0-r9

# Set CHROME_BIN environment variable - this is needed by Karma
ENV CHROME_BIN=/usr/bin/chromium-browser

USER root
