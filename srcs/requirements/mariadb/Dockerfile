FROM alpine:3.17.0

RUN apk update && apk add mariadb mariadb-client

# creates initial tables needed by mysql
RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# creates missing directories
RUN mkdir -p /run/mysqld


CMD ["mysqld", "--user=root"]


EXPOSE 3306