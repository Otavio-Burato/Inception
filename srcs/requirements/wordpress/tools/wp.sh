#!/bin/sh

if ! wp core is-installed --allow-root --path=/var/www/wordpress; then
	wp core download --path=/var/www/html --allow-root
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	wp core install --allow-root --path=/var/www/html --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${MYSQL_ROOT_PASSWORD} --admin_password=${WORDPRESS_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}
	wp plugin uninstall --allow-root --path=/var/www/html akismet hello
	wp plugin update --all --allow-root --path=/var/www/html
	chown -R www-data:www-data /var/www/html
	chmod -R 774 /var/www/html
	rm -rf wordpress
else
	echo "wordpress already downloaded"
fi
php-fpm7.4 -F
