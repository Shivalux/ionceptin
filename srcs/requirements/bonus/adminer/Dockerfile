FROM	debian:buster

WORKDIR /var/www/wordpress/adminer

RUN		apt update && apt -y upgrade;
RUN		apt install -y wget vim telnet php-fpm;
RUN		mkdir /var/run/php;

EXPOSE 9000

ENTRYPOINT	wget https://www.adminer.org/latest.php && mv latest.php index.php;
