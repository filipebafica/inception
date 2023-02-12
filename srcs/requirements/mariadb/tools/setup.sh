#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE $MYSQL_DATABASE;"
mysql -e "CREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%'"
mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES"
