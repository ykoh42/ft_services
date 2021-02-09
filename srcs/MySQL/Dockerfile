# # 시작 이미지
# FROM	alpine
# # 포트
# EXPOSE	3306

# # 필요한 것들 설치
# RUN		apk add mysql vim mysql-client

# # RUN		echo 'root:' | chpasswd
# # 폴더 만들기
# RUN 	mkdir -p /run/mysqld
# RUN		mysql_install_db --datadir=/var/lib/mysql

# # RUN		printf "[mysqld]\nuser = root\ndatadir = /var/lib/mysql\nport = 3306\nlog-bin = /var/lib/mysql/mysql-bin\nbind-address = 0.0.0.0\nskip-networking = false" >> /etc/my.cnf

# RUN	printf "[mysql]\nuser=user\npassword=pass\n[mysqladmin]\nuser=user\npassword=pass\n" >> /etc/my.cnf
# RUN printf "FLUSH PRIVILEGES;\nCREATE DATABASE wordpress;\nGRANT ALL ON *.* TO 'root'@'%%' IDENTIFIED BY 'pass' WITH GRANT OPTION;\nFLUSH PRIVILEGES;" > init.sql
# RUN mysqld --user=root --bootstrap < init.sql
# CMD mysqld --user=root --datadir=/var/lib/mysql/ --port=3306 --bind-address=0.0.0.0 --skip-networking=0



# # RUN	printf "[mysql]\nuser=user\npassword=pass\n[mysqladmin]\nuser=user\npassword=pass\n" >> /etc/my.cnf
# # RUN	mysql_install_db --datadir=/var/lib/mysql
# # RUN printf "FLUSH PRIVILEGES;\nCREATE DATABASE wordpress;\nGRANT ALL ON *.* TO 'user'@'%%' IDENTIFIED BY 'pass' WITH GRANT OPTION;\nFLUSH PRIVILEGES;" | mysqld --user=root --bootstrap

# # user = root
# # datadir = /var/lib/mysql/
# # log-bin = /var/lib/mysql-bin
# # port = 3306
# # bind-address = 0.0.0.0
# # skip-networking = false


# FROM	alpine
# RUN		apk add mysql mysql-client

#RUN addgroup mysql mysql ??

# COPY ./setup.sh /usr/sbin/setup.sh
# RUN chmod +x /usr/sbin/setup.sh
# COPY my.cnf /etc/mysql/my.cnf
# RUN chmod 644 /etc/mysql/my.cnf

# EXPOSE 3306

# ENTRYPOINT ["/usr/sbin/setup.sh"]



FROM	alpine
EXPOSE	3306
RUN		apk add mysql mysql-client
RUN 	mkdir -p /run/mysqld
# COPY	my.cnf /etc/my.cnf
COPY	setup.sh /
RUN		chmod +x setup.sh
CMD		./setup.sh