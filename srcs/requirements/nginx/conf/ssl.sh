openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
-out /etc/nginx/ssl/mlaouedj.pem \
-keyout /etc/nginx/ssl/mlaouedj.key \
-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=mlaouedj/CN=mlaouedj/"
