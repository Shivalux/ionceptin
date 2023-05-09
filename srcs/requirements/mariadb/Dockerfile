# * defual_port  = 3306
FROM	debian:buster
WORKDIR /app
COPY	mariadb_script.sh .
RUN		chmod 777 mariadb_script.sh;
EXPOSE		3306
ENTRYPOINT	bash mariadb_script.sh;
