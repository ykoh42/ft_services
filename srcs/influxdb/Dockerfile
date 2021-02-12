FROM		alpine
EXPOSE		8086
RUN			apk add influxdb
RUN			mkdir -p /var/lib/influxdb
ENTRYPOINT	[ "/usr/sbin/influxd" ]