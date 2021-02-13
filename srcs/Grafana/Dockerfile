FROM		alpine
EXPOSE		3000
RUN			apk add grafana
COPY		dashboards /usr/share/grafana/public/dashboards
ENTRYPOINT	[ "/usr/sbin/grafana-server", "--homepath=/usr/share/grafana" ]