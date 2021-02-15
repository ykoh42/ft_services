adduser --disabled-password $USER
echo "$USER:$PASSWORD" | chpasswd
mkdir -p /run/nginx
mkdir -p /var/www/phpmyadmin/tmp
chmod 777 /var/www/phpmyadmin/tmp
php-fpm7
nginx -g "daemon off;"