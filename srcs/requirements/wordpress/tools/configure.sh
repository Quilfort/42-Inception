#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "installing WordPress"

    wp-cli.phar core download --path="/var/www/html" --allow-root
    wp-cli.phar config create --path="/var/www/html" \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USERNAME \
    --dbpass=$MYSQL_PASSWORD= \
    --dbhost=$MYSQL_HOSTNAME \
    --allow-root

    wp-cli.phar core install --path="/var/www/html" \
    --title="Inception Website"
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email="WP_ADMIN@DOMAIN_NAME" \
    --skip-email \
    --allow-root

    wp user create "$WP_USER" $WP_USER@$DOMAIN_NAME \
    --path="/var/www/html" \
    --user_pass=$WP_USER_PASSWORD
    --allow-root

else
    echo "WordPress is installed in website"

fi

exex "$@"