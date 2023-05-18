#!/bin/bash

mkdir -p /var/www/wordpress/static_webpage
mv index.html /var/www/wordpress/static_webpage/index.html
mv -f images /var/www/wordpress/static_webpage/images
sleep infinity