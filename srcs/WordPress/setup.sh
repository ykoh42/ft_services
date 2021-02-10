mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php \
&&	sed -i "s/localhost/mysql/g" /var/www/wordpress/wp-config.php \
&&	sed -i "s/database_name_here/wordpress/g" /var/www/wordpress/wp-config.php \
&&	sed -i "s/username_here/$USER/g" /var/www/wordpress/wp-config.php \
&& 	sed -i "s/password_here/$PASSWORD/g" /var/www/wordpress/wp-config.php 

mkdir -p /run/nginx
php-fpm7 && nginx -g "daemon off;"