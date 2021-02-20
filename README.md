# Welcome to the `ft_services`! ![score](https://img.shields.io/badge/100/100-5cb85c?style=for-the-badge) 
>  This is a System Administration and Networking project with Kubernetes.

The project consists of setting up an infrastructure of different services(Grafana, WordPress, PhpMyadmin and so on). 

![Project diagram](https://github.com/kohyounghwan/ft_services/blob/master/diagram.png?raw=true)

## Getting started
**1. Install Docker Desktop.**

	https://www.docker.com/get-started
	

**2. Enable single-node cluster on your local system.**

	docker > preferences > Kubernetes > Enable Kubernetes > Apply & Restart	

reference : https://docs.docker.com/docker-for-mac/#kubernetes

**3. Clone this repository.**

```sh
git clone https://github.com/kohyounghwan/ft_services.git
cd ft_services
```

**4. Select which ethernet you are going to use.**

```sh
# Search with 'ifconfig'
# default 'en0', if you want to change en1, type below
sed -i "" "s/en0/en1/g" setup.sh
```

**5. Execute setup.sh**

```sh
./setup.sh
```

## TEST
### Nginx
Test with safari(private browsing).
- [x] http://IP(:80) 301 redirection to https://IP
- [x] https://IP/wordpress 
- [x] https://IP/phpmyadmin

### FTPS
Test with curl or filezilla.
- [x] TLS
- [x] upload
- [x] download

### WordPress, MySQL and PhpMyAdmin
Test with safari(private browsing).
- [x] Write comments.
- [x] Check `wp_comments` table with PhpMyAdmin.
- [x] Delete MySQL pod and check comments are still exist.

### Grafana and influxDB
Test with safari(private browsing).
- [x] Check Grafana is monitoring all containers with dashboard.
- [x] Delete influxDB pod and check data is still exist.

### Persistence
Test with terminal.
- [x] `kubectl exec deploy/ftps -- pkill vsftpd`
- [x] `kubectl exec deploy/grafana -- pkill grafana`
- [x] `kubectl exec deploy/influxdb -- pkill influxd`
- [x] `kubectl exec deploy/mysql -- pkill mysqld`
- [x] `kubectl exec deploy/nginx -- pkill nginx`
- [x] `kubectl exec deploy/phpmyadmin -- pkill nginx`
- [x] `kubectl exec deploy/phpmyadmin -- pkill php-fpm`
- [x] `kubectl exec deploy/wordpress -- pkill nginx`
- [x] `kubectl exec deploy/wordpress -- pkill php-fpm`