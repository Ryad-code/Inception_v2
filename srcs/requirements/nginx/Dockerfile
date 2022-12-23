FROM		debian:buster

MAINTAINER	mlaouedj <mlaouedj@student.42.fr>

#Update & Upgrade
RUN		apt-get update -y
RUN		apt-get upgrade -y

#Nginx & OpenSSL installation
RUN		apt-get -y install nginx openssl

#Configuration Nginx
RUN             mkdir -p /run/nginx
RUN		mkdir -p /var/www/inception/html
RUN		chown -R www-data:www-data /var/www/inception
COPY            conf/inception.conf /etc/nginx/sites-available/inception
RUN		ln -s /etc/nginx/sites-available/inception /etc/nginx/sites-enabled
RUN		rm -rf  /var/www/html /etc/nginx/sites-enabled/default

#Configuration SSL
RUN		mkdir /etc/nginx/ssl
COPY		conf/ssl.sh /etc/nginx/ssl
RUN		chmod 777 /etc/nginx/ssl/ssl.sh
RUN		./etc/nginx/ssl/ssl.sh

#Running Nginx deamon
CMD		["nginx", "-g", "daemon off;"]
