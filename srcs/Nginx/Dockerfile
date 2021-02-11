FROM		alpine
EXPOSE		80 443 22
RUN			apk add nginx openssl openssh
RUN			mkdir -p /run/nginx
COPY		entry.sh /tmp
RUN			chmod +x /tmp/entry.sh
ENTRYPOINT	[ "/bin/sh", "/tmp/entry.sh" ]
