FROM php:8.2-fpm-alpine

# Install optional extensions
RUN docker-php-ext-install mysqli

WORKDIR /var/www/html

COPY ../php-app /var/www/html

#test