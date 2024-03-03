#!/bin/sh

if ! wp core is-installed --allow-root --path=/var/www/wordpress; then
	wp core download --path=/var/www/html --allow-root
	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	wp config set DB_NAME $MYSQL_DATABASE --allow-root --path=/var/www/html/
	wp config set DB_USER $MYSQL_USER --allow-root --path=/var/www/html/
	wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root --path=/var/www/html/
	wp config set DB_HOST $MYSQL_HOSTNAME --allow-root --path=/var/www/html/
	wp core install --allow-root --path=/var/www/html --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}
	wp plugin uninstall --allow-root --path=/var/www/html akismet hello
	wp plugin update --all --allow-root --path=/var/www/html
	chown -R www-data:www-data /var/www/html
	chmod -R 774 /var/www/html
	rm -rf wordpress
else
	echo "wordpress already downloaded"
fi
php-fpm7.4 -F
