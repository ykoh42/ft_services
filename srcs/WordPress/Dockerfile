FROM		alpine:3.12
EXPOSE		5050
RUN			apk add nginx php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN			wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN			tar -xzvf /tmp/wordpress.tar.gz -C /var/www
COPY		entry.sh /tmp
RUN			chmod +x /tmp/entry.sh
ENTRYPOINT	[ "/bin/sh", "/tmp/entry.sh" ]