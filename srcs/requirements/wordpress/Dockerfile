FROM alpine:3.17.0


# Add to the apk repository
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories


# Install dependecies
RUN apk update && apk upgrade && apk add php7 php7-fpm bash


# Change fpm port
RUN echo listen = 0.0.0.0:9000 >> /etc/php7/php-fpm.d/www.conf


# Download and extract WordPress
RUN mkdir -p /var/www/html
RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1
RUN rm /tmp/wordpress.tar.gz

EXPOSE 9000

CMD [ "php-fpm7", "-F", "-R" ]