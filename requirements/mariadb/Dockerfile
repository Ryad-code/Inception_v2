
FROM		debian:buster

MAINTAINER	mlaouedj <mlaouedj@student.42.fr>

#Update & Upgarde
RUN		apt-get update -y
RUN		apt-get upgrade -y

#Installing MariaDB
RUN		apt-get -y install mariadb-server

#Copying and making accessible start.sh
COPY		conf/start.sh /usr/local/bin
RUN             chmod 777 /usr/local/bin/start.sh

#Copying setup file
COPY		conf/mysql_file.cnf /etc/mysql/mariadb.conf.d/

#Creating repositories
RUN		mkdir -p /run/mysqld && chown -R mysql:root /run/mysqld && chown -R mysql:mysql /var/lib/mysql

#Running starting script
ENTRYPOINT	["bash", "/usr/local/bin/start.sh"]

CMD		["mysqld"]
