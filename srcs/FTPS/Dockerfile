# Step 1 : From image
FROM	alpine
EXPOSE	20 21 20020-20021
# Step 3 : Install
RUN		apk add vsftpd vim openrc openssl

RUN		echo 'root:' | chpasswd

RUN		sed -i "s/anonymous_enable=YES/anonymous_enable=NO/g" /etc/vsftpd/vsftpd.conf \
&& 		sed -i "s/#local_enable=YES/local_enable=YES/g" /etc/vsftpd/vsftpd.conf \
&& 		sed -i "s/#write_enable=YES/write_enable=YES/g" /etc/vsftpd/vsftpd.conf \
&&		echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf \
&&		printf "pasv_enable=YES\npasv_min_port=20020\npasv_max_port=20021\n" >> /etc/vsftpd/vsftpd.conf

# Step 4 : Config SSL(Self signed Certificate)
RUN	openssl req					\
	-x509 -nodes -days 365 -newkey rsa:2048		\
	-keyout /etc/ssl/private/localhost.key		\
	-out /etc/ssl/certs/localhost.crt		\
	-subj "/C=KR/ST=Seoul/O=42Seoul/CN=localhost"

RUN	echo 'ssl_enable=YES' >> /etc/vsftpd/vsftpd.conf \
&&	echo 'rsa_cert_file=/etc/ssl/certs/localhost.crt' >> /etc/vsftpd/vsftpd.conf \
&&	echo 'rsa_private_key_file=/etc/ssl/private/localhost.key' >> /etc/vsftpd/vsftpd.conf

# RUN		sed -i "s/#local_umask=022/local_umask=022/g" /etc/vsftpd/vsftpd.conf



CMD	vsftpd /etc/vsftpd/vsftpd.conf