FROM alpine:3.19

# Install packages
RUN apk add --no-cache \
    nginx \
    php82 \
    php82-fpm \
    php82-opcache \
    php82-mysqli \
    php82-json

# Create nginx run directory
RUN mkdir -p /run/nginx

# Copy config files
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.php /var/www/localhost/htdocs/index.php

# Start services
CMD php-fpm82 && nginx -g "daemon off;"