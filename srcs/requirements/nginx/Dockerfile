FROM alpine:3.17.0

RUN apk update && apk add nginx openssl bash

RUN openssl req \ 
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/nginx/ssl/nginx.key \
            -out /etc/nginx/ssl/nginx.crt \
            -subj "/C=BR/ST=SP/L=City/O=42/CN=fbafica.42.fr"

CMD ["nginx", "-g daemon off;"]

EXPOSE 80