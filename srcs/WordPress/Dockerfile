# Step 1 : From image
FROM	alpine
EXPOSE	5050

# # Step 3 : Install
# RUN		apk add nginx wget php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
# RUN		apk add nginx php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
RUN 	apk add nginx php php-fpm php-mysqli


# Config wordpress
RUN	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz \
&& 	tar -xzvf /tmp/wordpress.tar.gz -C /var/www \
&&	mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php \
# &&	chown -R root /var/www/wordpress \
&&	sed -i "s/database_name_here/wordpress/g" /var/www/wordpress/wp-config.php \
&&	sed -i "s/username_here/root/g" /var/www/wordpress/wp-config.php \
&& 	sed -i "s/password_here//g" /var/www/wordpress/wp-config.php

COPY	default.conf /etc/nginx/conf.d

RUN		mkdir -p /run/nginx

CMD		php-fpm7 && nginx -g "daemon off;"

