FROM		alpine
EXPOSE		3000
RUN			apk add grafana
# RUN			mkdir -p /etc/grafana
# COPY		provisioning/dashboards /usr/share/grafana/public/dashboards
# COPY		provisioning/datasources/influxdb-source.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb-source.yaml
# COPY		provisioning/dashboards/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml

COPY		dashboards /usr/share/grafana/public/dashboards
ENTRYPOINT	[ "/usr/sbin/grafana-server", "--homepath=/usr/share/grafana" ]
# ENTRYPOINT	["/usr/sbin/grafana-server","--config=/usr/share/grafana/conf/custom.ini","--homepath=/usr/share/grafana"]