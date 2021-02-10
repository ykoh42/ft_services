FROM		alpine
EXPOSE		3306
RUN			apk add mysql mysql-client
RUN 		mkdir -p /run/mysqld

# RUN			mysql_install_db --datadir=/var/lib/mysql

COPY		setup.sh /tmp
RUN			chmod +x /tmp/setup.sh
# CMD		/tmp/setup.sh
ENTRYPOINT	/tmp/setup.sh