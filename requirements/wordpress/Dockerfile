FROM		debian:buster

RUN		apt-get -y update
Run		apt-get upgrade
RUN		apt-get -y install wget mariadb-client php7.3-fpm php7.3-common php7.3-mysql

#RUN		apt-get -y install procps

RUN     	mkdir -p /var/www/inception/html

COPY		conf/start.sh /tmp/
COPY		conf/wordpress.conf /etc/php/7.3/fpm/pool.d/

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		cp wp-cli.phar /usr/bin/wp
RUN		mkdir -p /var/run/php/

WORKDIR 	/var/www/inception/html

ENTRYPOINT	["bash", "/tmp/start.sh"]

CMD		["php-fpm7.3", "-F", "-R"]
