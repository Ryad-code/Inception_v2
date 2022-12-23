#!/bin/bash

wp core download --allow-root
wp config create --dbname="wordpress" --dbuser="mlaouedj" --dbpass="BnRyALLL" --dbhost=mariadb --dbcollate="utf8_general_ci" --allow-root 

wp core install --url="mlaouedj.42.fr" --title=testsite --admin_user="mlaouedj" --admin_password="BnRyALLL" --admin_email="mlaouedj@student.42.fr" --skip-email --allow-root

wp user create "guest" "guest@student.42.fr" --user_pass="guest_password" --role=subscriber --allow-root

exec "$@"
