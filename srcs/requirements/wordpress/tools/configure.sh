#!/bin/bash

mkdir /var/www/
mkdir /var/www/html
cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php