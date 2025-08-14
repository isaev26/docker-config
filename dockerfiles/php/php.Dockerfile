FROM php:8.3-fpm-alpine

WORKDIR /var/www/laravel

RUN apk update && apk add --no-cache \
    autoconf \
    g++ \
    make \
    linux-headers \
    shadow \
    bash

RUN docker-php-ext-install pdo_mysql mysqli

RUN pecl install xdebug && docker-php-ext-enable xdebug
