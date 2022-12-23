#!/bin/bash
#If wordpress database doesn't exist --> First time running the container
if [ ! -d /var/lib/mysql/wordpress ]; then
	mysqld&
	until mysqladmin ping; do
		sleep 1
	done
	echo "create database if not exists wordpress;" | mysql -u root #initiates mysql connection with username root
	echo "create user if not exists 'mlaouedj' identified by 'BnRyALLL';" | mysql -u root

	echo "grant usage on wordpress.* TO 'mlaouedj'@'%' identified by 'BnRyALLL';" | mysql -u root
	
	echo "grant all privileges on wordpress.* TO 'mlaouedj'@'%' identified by 'BnRyALLL';" | mysql -u root
	echo "flush privileges;" | mysql -u root
	
	echo "alter user 'root'@'%' identified by 'AbRiBuS';" | mysql -u root
	
	killall mysqld
fi

exec "$@"
