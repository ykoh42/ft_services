FROM		alpine
EXPOSE		3306
RUN			apk add mysql mysql-client
COPY		entry.sh /tmp
RUN			chmod +x /tmp/entry.sh
ENTRYPOINT	[ "/bin/sh", "/tmp/entry.sh" ]