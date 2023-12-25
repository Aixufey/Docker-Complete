# https://hub.docker.com/_/php/tags?page=2&name=fpm
# fpm is required for this nginx.config
FROM php:8.3.1RC3-fpm-alpine3.19

# All containers use this as the folder
WORKDIR /var/www/html

# Extra dependencies
RUN docker-php-ext-install pdo pdo_mysql

# If no CMD or ENTRYPOINT is provided, use base image's default.
# The php image will invoke this PHP interpreter.