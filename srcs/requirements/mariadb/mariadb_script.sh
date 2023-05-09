#!/bin/bash

service mysql status
isMariadbInstall=$?
isFirst=0

# * install mariadb service with apt ;
if [ $isMariadbInstall -eq 1 ]; then
	unset MYSQL_HOST
	echo -e "${BLUE}-> preparing installed mariadb service....${NORMAL}"
	apt update && apt -y upgrade;
	# * install mariadb server and client ;
	apt install -y mariadb-server mariadb-client;
	# * remove bind-address in /etc/mysql/mariadb.conf.d/50-server.cnf ;
	sed -i '/bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf;
	# * start mysql service for setting ;
	service mysql start;
	# * set secure mairadb installation with setting root password ;
	mysql_secure_installation << EOF

y
$MYSQL_ROOTPASS
$MYSQL_ROOTPASS
y
n
y
y
EOF
	isFirst=1;
	echo -e "${GREEN}mariadb is installed.... :)${NORMAL}";
else
	service mysql start;
	echo -e "${GREEN}mariadb has been already installed.${NORMAL}";
fi

# * create database in mysql by using MYSQL_NAME in environment ;
if [ $isFirst -eq 1 ] && [ ! -d "/var/lib/mysql/$MYSQL_NAME" ]; then
	mysql -Bse "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;";
	echo "${GREEN}database is created.... :)${NORMAL}";
else
	echo -e "${GREEN}database has been already created${NORMAL}";
fi

# * create first users for mysql from evironment valiable $MYSQL_USERNAME_ADMIN, $MYSQL_PASSWORD_ADMIN ;
if [ $isFirst -eq 1 ] && ( ! mysql -Bse "SHOW GRANTS FOR $MYSQL_USERNAME_ADMIN@'%';" ); then
	mysql -Bse "CREATE USER $MYSQL_USERNAME_ADMIN@'%' IDENTIFIED BY '$MYSQL_PASSWORD_ADMIN';";
	mysql -Bse "GRANT ALL PRIVILEGES ON *.* TO $MYSQL_USERNAME_ADMIN@'%' IDENTIFIED BY '$MYSQL_PASSWORD_ADMIN';";
	mysql -Bse "FLUSH PRIVILEGES;";
	echo -e "${GREEN}sharnvon is created.... :)${NORMAL}";
else
	echo -e "${GREEN}sharnvon has been already created${NORMAL}";
fi

# * create seccond users for mysql from environment valiable  $MYSQL_USERNAME, $MYSQL_PASSWORD;
if [ $isFirst -eq 1 ] && ( ! mysql -Bse "SHOW GRANTS FOR $MYSQL_USERNAME@'%';" ); then
	mysql -Bse "CREATE USER $MYSQL_USERNAME@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
	mysql -Bse "GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO $MYSQL_USERNAME@'%' IDENTIFIED BY '$MYSQL_ROOTPASS';";
	mysql -Bse "FLUSH PRIVILEGES;";
	echo -e "${GREEN}novnrahs is created.... :)${NORMAL}";
else
	echo -e "${GREEN}novnrahs has been already created${NORMAL}";
fi

echo -e "${YELLOW}>>>> the mariadb container is ready to conected <<<${NORMAL}"

# * run last command for holding the container ;
mysqld -u mysql
# bash
