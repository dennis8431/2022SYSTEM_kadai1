FROM php:8.1-fpm-alpine AS php
RUN apk add -U --no-cache curl-dev
RUN docker-php-ext-install curl
RUN docker-php-ext-install exif

RUN apk add autoconf g++ make

RUN apk add libpng-dev
RUN docker-php-ext-install gd

RUN docker-php-ext-install pdo_mysql

RUN echo -e "post_max_size = 5M\nupload_max_filesize = 5M" >> ${PHP_INI_DIR}/php.ini

RUN install -o www-data -g www-data -d /var/www/upload/image/
