#!/bin/sh


# get env into wp-config
sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOST/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

sleep 10
# setups 5 min installation
wp core install --allow-root --url=https://fbafica.42.fr --title="A very creative blog title" --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$MYSQL_USER@email.com
wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER@email.com --user_pass=$WORDPRESS_PASSWORD 

# starts php-fpm deamon in foreground mode
php-fpm7.4 -F -R
