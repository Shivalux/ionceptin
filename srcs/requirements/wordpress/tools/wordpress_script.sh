#!/bin/bash

# * looping util mariadb container finish setting up
mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN
while [ $? -eq 1 ]; do
	mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN
	echo wait...
done

wp-cli core download --allow-root;
wp-cli config create --dbname=$MYSQL_NAME --dbuser=$MYSQL_USERNAME_ADMIN --dbpass=$MYSQL_PASSWORD_ADMIN --dbhost=$MYSQL_HOST --allow-root;
wp-cli core install --url=sharnvon.42.fr --title=HELLO_WORLD --admin_user=$MYSQL_USERNAME_ADMIN --admin_email=sharnvon@42bangkok.com --allow-root;


