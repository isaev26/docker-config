FROM php:8.4-fpm-alpine

WORKDIR /var/www/laravel

RUN apk update && apk add --no-cache \
    autoconf \
    g++ \
    make \
    linux-headers \
    shadow \
    bash \
    icu-dev \
    icu-libs

RUN docker-php-ext-install pdo_mysql mysqli intl

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN chown -R www-data:www-data /var/www/laravel/storage /var/www/laravel/bootstrap/cache 2>/dev/null || true
