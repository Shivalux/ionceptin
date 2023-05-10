#!/bin/bash

# * looping util mariadb container finish setting up ;
mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN
while [ $? -eq 1 ]; do
	mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN
done

# * create config file for wordpress to passing thought wordpress website ;
wp-cli config create --dbname=$MYSQL_NAME --dbuser=$MYSQL_USERNAME_ADMIN --dbpass=$MYSQL_PASSWORD_ADMIN --dbhost=$MYSQL_HOST --allow-root;
wp-cli core install --url=sharnvon.42.fr --title=$WEB_TITLE --admin_user=$MYSQL_USERNAME_ADMIN --admin_email=$WEB_EMAIL --allow-root;
