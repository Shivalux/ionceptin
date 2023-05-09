# * docker run --name test --rm -it --cap-add=NET_ADMIN -p 9000:9000 test
FROM	debian:buster
WORKDIR /app
RUN		apt update && apt -y upgrade; \
		apt -y install nginx openssl ufw \
		vim telnet curl;
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		# -subj "/C=TH/ST=ChiangMai/O=MySharnvon, Inc./CN=$DOMAIN_NAME" \
		-subj "/C=TH/ST=ChiangMai/O=MySharnvon, Inc./CN=shranvon.42.fr" \
		# -addext "subjectAltName=DNS:$DOMAIN_NAME" \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt;
COPY	./conf/defualt.conf /etc/nginx/conf.d/
# RUN		service nginx restart
EXPOSE	80
EXPOSE	443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=TH/ST=ChiangMai/O=MySharnvon, Inc./CN=$DOMAIN_NAME" -addext "subjectAltName=DNS:$DOMAIN_NAME" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt