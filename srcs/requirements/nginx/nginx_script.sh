#!/bin/bash

# if [[  ]]
# ufw enable
# ufw allow 'Nginx HTTPS'
# ufw allow 9000
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=TH/ST=ChiangMai/O=MySharnvon, Inc./CN=$DOMAIN_NAME" -addext "subjectAltName=DNS:$DOMAIN_NAME" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

# mv defualt.conf /etc/nginx/conf.d/defualt.conf

service nginx start


# systemctl start nginx
# mkdir -p /var/www/$DOMAIN_NAME/html
# cp index.html /var/www/$DOMAIN_NAME/html

# * run last command for holding the container ;
# bash
nginx -g "daemon off;"