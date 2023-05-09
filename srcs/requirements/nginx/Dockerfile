# * docker run --name test --rm -it --cap-add=NET_ADMIN -p 9000:9000 test
FROM	debian:buster
WORKDIR /app
RUN		apt update && apt -y upgrade; \
		apt -y install nginx openssl ufw \
		vim telnet curl;
# RUN		ufw enable; \
# 		ufw allow 'Nginx HTTPS'; \
# 		ufw allow 9000;
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		# -subj "/C=TH/ST=ChiangMai/O=MySharnvon, Inc./CN=$DOMAIN_NAME" \
		-subj "/C=TH/ST=ChiangMai/O=MySharnvon, Inc./CN=shranvon.42.fr" \
		# -addext "subjectAltName=DNS:$DOMAIN_NAME" \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt;
COPY	./defualt.conf /etc/nginx/conf.d/
# RUN		service nginx restart
# RUN		service nginx start;
# COPY	./nginx_script.sh .
# RUN		chmod 777 ./nginx_script.sh
EXPOSE	80
EXPOSE	443
# ENTRYPOINT	nginx -g "daemon off;";
# ENTRYPOINT sleep infinity

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# CMD		[ "sh", "/app/nginx_script.sh" ]
# ENTRYPOINT	service nginx start;
# CMD		nginx -g "daemon off;";
# CMD		bash;

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=TH/ST=ChiangMai/O=MySharnvon, Inc./CN=$DOMAIN_NAME" -addext "subjectAltName=DNS:$DOMAIN_NAME" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt