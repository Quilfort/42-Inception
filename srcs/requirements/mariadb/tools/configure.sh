#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	echo "Creating MariaDB"

    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    {
        echo "FLUSH PRIVILEGES;";
        echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
        echo "CREATE USER IF NOT EXISTS $MYSQL_USERNAME@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
		echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USERNAME'@'%';"
        echo "FLUSH PRIVILEGES;";
    } | mysqld --bootstrap

else
    echo "MariaDB is already configured"

fi

exec "$@"