FROM		alpine
EXPOSE		5000
RUN 		apk add nginx php php-fpm php-mbstring php-json php-session php-mysqli php-session
RUN			wget -O /tmp/phpmyadmin.tar.gz https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN			tar -xzvf /tmp/phpmyadmin.tar.gz -C /var/www
RUN 		mv /var/www/php* /var/www/phpmyadmin
COPY		entry.sh /tmp
RUN			chmod +x /tmp/entry.sh
ENTRYPOINT	[ "/bin/sh", "/tmp/entry.sh" ]