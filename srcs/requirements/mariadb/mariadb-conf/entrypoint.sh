#!/bin/sh


# starts mysql service
service mariadb start


#create db and users that are passed via .env
mysql -e "CREATE DATABASE $DB_NAME;"
mysql -e "CREATE USER $DB_USER@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';"


# stops mysql service
service mariadb stop


# starts mysql deamon in foreground mode
mysqld --user=root


