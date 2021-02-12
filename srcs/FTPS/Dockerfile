FROM		alpine
EXPOSE		21 20000-20004
RUN			apk add vsftpd openssl
COPY		entry.sh /tmp
RUN			chmod +x /tmp/entry.sh
ENTRYPOINT	[ "/bin/sh", "/tmp/entry.sh" ]