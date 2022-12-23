FROM		debian:buster

MAINTAINER	mlaouedj <mlaouedj@student.42.fr>

#Update & Upgrade
RUN		apt-get -y update
RUN		apt-get -y upgrade

#Installing WGET, MARIADB client & PHP-fpm
RUN		apt-get -y install wget mariadb-client php7.3-fpm php7.3-common php7.3-mysql

#Creatinf the working directory
RUN     	mkdir -p /var/www/inception/html

#Copying starting script & Wordpress setup file
COPY		conf/start.sh /tmp/
COPY		conf/wordpress.conf /etc/php/7.3/fpm/pool.d/

#Downloading wordpress installation program
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		cp wp-cli.phar /usr/bin/wp
RUN		mkdir -p /var/run/php/

#Working directory
WORKDIR 	/var/www/inception/html

ENTRYPOINT	["bash", "/tmp/start.sh"]

CMD		["php-fpm7.3", "-F", "-R"]
