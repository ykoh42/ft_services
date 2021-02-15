FROM		alpine
EXPOSE		80 443 22
RUN			apk add nginx openssl openssh
COPY		entry.sh /tmp
RUN			chmod +x /tmp/entry.sh
ENTRYPOINT	[ "/bin/sh", "/tmp/entry.sh" ]