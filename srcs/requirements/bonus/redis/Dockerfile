FROM	debian:buster

WORKDIR /app

RUN		apt update && apt -y upgrade;
RUN		apt install -y vim telnet redis-server;
RUN		sed -i '/bind 127.0.0.1 ::/d' /etc/redis/redis.conf

EXPOSE	6379

ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]
