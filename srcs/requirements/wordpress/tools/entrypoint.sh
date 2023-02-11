#!/bin/sh


# get env into wp-config
sed -i "s/username_here/$DB_ADMIN_USER/g" wp-config-sample.php
sed -i "s/password_here/$DB_ADMIN_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

sleep 10
# setups 5 min installation
wp core install --allow-root --url=localhost:443 --title="A very creative blog title" --admin_user=$DB_ADMIN_USER --admin_password=$DB_ADMIN_PASSWORD --admin_email=email@email.com


# starts php-fpm deamon in foreground mode
php-fpm7.4 -F -R
