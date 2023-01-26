FROM alpine:3.17.0

RUN apk update && apk add mariadb mariadb-client

# initialize MySQL data directory
RUN mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql

# creates missing directories
RUN mkdir -p /run/mysqld

# creates directory that will receive script to create users (from docker-compose.yaml)
RUN mkdir -p ./mariadb-conf

ENTRYPOINT [ "mysqld", "--user=root", "--init-file=/var/lib/mysql/init.sql" ]

EXPOSE 3306