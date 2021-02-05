FROM	alpine
EXPOSE	80 443 22

RUN		apk add nginx openssl openssh

RUN		mkdir -p /run/nginx

RUN		openssl req					\
		-x509 -nodes -days 365 -newkey rsa:2048		\
		-keyout /etc/ssl/private/localhost.key		\
		-out /etc/ssl/certs/localhost.crt		\
		-subj "/C=KR/ST=Seoul/O=42Seoul/CN=localhost"

COPY	default.conf /etc/nginx/conf.d


RUN		sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
&& sed 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' -i /etc/ssh/sshd_config \
&& echo 'root:' | chpasswd \
&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
&& ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
&& mkdir -p /var/run/sshd

CMD /usr/sbin/sshd && nginx -g "daemon off;"
