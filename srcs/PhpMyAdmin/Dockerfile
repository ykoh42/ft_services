FROM	alpine
EXPOSE	5000

RUN 	apk add nginx php php-fpm php-mbstring php-json php-session php-mysqli php-session

RUN	wget -O /tmp/phpmyadmin.tar.gz https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz \
&& tar -xzvf /tmp/phpmyadmin.tar.gz -C /var/www \
&& mv /var/www/php* /var/www/phpmyadmin \
&& mv /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php \
&& sed -i '/AllowNoPassword/ s/false/true/g' /var/www/phpmyadmin/config.inc.php

COPY	default.conf /etc/nginx/http.d
RUN		mkdir -p /run/nginx

CMD		php-fpm7 && nginx -g "daemon off;"
