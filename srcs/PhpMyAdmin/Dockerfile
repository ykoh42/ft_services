FROM	alpine
EXPOSE	5000

RUN 	apk add nginx php php-fpm php-mbstring php-json php-session php-mysqli php-session

RUN		wget -O /tmp/phpmyadmin.tar.gz https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz \
&& tar -xzvf /tmp/phpmyadmin.tar.gz -C /var/www \
&& mv /var/www/php* /var/www/phpmyadmin \
&& mv /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php \
&& sed -i '/AllowNoPassword/ s/false/true/g' /var/www/phpmyadmin/config.inc.php \
&& sed -i "/Servers/ s/localhost/mysql/g" /var/www/phpmyadmin/config.inc.php \
&& sed -i "/blowfish_secret/ s/''/'2MMdSSZk[Wyp2buN5Y4vAw.BhmjpTz5u'/g" /var/www/phpmyadmin/config.inc.php

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/www/phpmyadmin/tmp
RUN 	chmod 777 /var/www/phpmyadmin/tmp
CMD		php-fpm7 && nginx -g "daemon off;"
