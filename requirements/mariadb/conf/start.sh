#!/bin/bash
#If wordpress database doesn't exist --> First time running the container
if [ ! -d /var/lib/mysql/wordpress ]; then
	mysqld&
	until mysqladmin ping; do
		sleep 1
	done
	echo "create database if not exists wordpress;" | mysql -u root
	
	echo "create user if not exists '$DB_USER' identified by '$DB_USER_PASSWORD';" | mysql -u root

	echo "grant usage on wordpress.* TO '$DB_USER'@'%' identified by '$DB_USER_PASSWORD';" | mysql -u root
	
	echo "grant all privileges on wordpress.* TO '$DB_USER'@'%' identified by '$DB_USER_PASSWORD';" | mysql -u root
	echo "flush privileges;" | mysql -u root
	
	echo "alter user 'root'@'%' identified by '$DB_ROOT_PASSWORD';" | mysql -u root
	
	killall mysqld
fi

exec "$@"
