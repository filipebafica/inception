FROM alpine:3.17.0


# Add to the apk repository
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories


# Install dependecies
RUN apk update && apk upgrade && apk add php8 php8-fpm php8-mysqli php8-phar curl bash


# Add php8 as php to PATH using a sybolic link, wp-cli calls for 'php'
RUN ln -s /usr/bin/php8 /usr/local/bin/php


# Download wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


# Add WP to PATH
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


# Install wordpress
RUN mkdir -p /var/www/html/
WORKDIR /var/www/html/
RUN wp core download


# Change fpm port
RUN echo listen = 0.0.0.0:9000 >> /etc/php8/php-fpm.d/www.conf


EXPOSE 9000

CMD [ "php-fpm8", "-F", "-R" ]