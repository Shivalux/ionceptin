#!/bin/bash

# * looping util mariadb container finished setting up ;
mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN
while [ $? -eq 1 ]; do
	mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN
done

# * create config file for wordpress to passing thought wordpress website ;
wp-cli config create --dbname=$MYSQL_NAME --dbuser=$MYSQL_USERNAME_ADMIN --dbpass=$MYSQL_PASSWORD_ADMIN --dbhost=$MYSQL_HOST --allow-root;
wp-cli core install --url=sharnvon.42.fr --title=$WEB_TITLE --admin_user=$MYSQL_USERNAME_ADMIN --admin_email=$WEB_EMAIL --allow-root;

# * looping util redis container finished setting up ;
redis-cli -h redis
while [ $? -eq 1 ]; do
	redis-cli -h redis
done

# * config the wp-config and install redis-cache plugin;
wp-cli config set WP_REDIS_HOST "redis" --allow-root;
wp-cli config set WP_REDIS_PORT "6379" --allow-root;
wp-cli config set WP_REDIS_TIMEOUT "1" --allow-root;
wp-cli config set WP_REDIS_READ_TIMEOUT "1" --allow-root;
wp-cli config set WP_REDIS_DATABASE "0" --allow-root;
wp-cli plugin install redis-cache --activate --allow-root;
wp-cli redis enable --allow-root;