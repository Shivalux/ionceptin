FROM	debian:buster
WORKDIR /var/www/wordpress/
RUN 	chown www-data:www-data /var/www/wordpress
RUN 	apt update && apt upgrade -y
RUN		apt -y install curl \
		vim telnet curl\
		mariadb-client \
		php \
		php-common \
		php-cli \
		php-fpm \
		php-json \
		php-pdo \
		php-mysql \
		php-zip \
		php-gd \
		php-mbstring \
		php-curl \
		php-xml \
		php-pear \
		php-bcmath;
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN 	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp-cli
RUN		mkdir -p /var/run/php;
RUN		wp-cli core download --allow-root;
		# wp-cli config create --dbname=$MYSQL_NAME --dbuser=$MYSQL_USERNAME_ADMIN --dbpass=$MYSQL_PASSWORD_ADMIN --dbhost=$MYSQL_HOST --allow-root; \
		# wp-cli core install --url=DOMAIN_NAME --title=HELLO_WORLD --admin_user=$MYSQL_USERNAME_ADMIN --admin_email=$WP_EMAIL --allow-root;

COPY conf/www.conf      /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE	9000
# ENTRYPOINT sleep infinity
ENTRYPOINT [ "php-fpm7.3", "-F", "-R" ]

# ENTRYPOINT bash
# ENTRYPOINT mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN
# ENTRYPOINT mysql -u mysql
# ENTRYPOINT 