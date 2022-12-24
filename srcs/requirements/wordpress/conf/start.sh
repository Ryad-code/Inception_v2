#!/bin/bash
if [ ! -d /var/www/inception/html/ ]; then
	wp core download --allow-root
	wp config create --dbname="wordpress" --dbuser=$DB_USER --dbpass=$DB_USER_PASSWORD --dbhost=mariadb --dbcollate="utf8_general_ci" --allow-root 

	wp core install --url=$URL --title=$SITE_NAME --admin_user=$DB_USER --admin_password=$DB_USER_PASSWORD --admin_email=$DB_USER_MAIL --skip-email --allow-root

	wp user create $GUEST_USER $GUEST_USER_MAIL --user_pass=$GUEST_USER_PASSWORD --role=subscriber --allow-root

fi

exec "$@"
