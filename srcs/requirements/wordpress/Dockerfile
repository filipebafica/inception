FROM debian:stable


# Install dependecies
RUN apt-get update && \
    apt-get install -y \
    php \
    php-fpm \
    php-mysqli \
    mariadb-client \
    curl


RUN mkdir -p /var/run/php && chmod 777 /var/run/php


# Download wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


# Add WP to PATH
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


# Install wordpress
RUN mkdir -p /var/www/html/
WORKDIR /var/www/html/
RUN wp core download --allow-root


# Change fpm port
RUN echo listen = 0.0.0.0:9000 >> /etc/php/7.4/fpm/pool.d/www.conf


ENTRYPOINT [ "/home/entrypoint/entrypoint.sh" ]


EXPOSE 9000
