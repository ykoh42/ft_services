#########################################################################################################################
# Delete image
#########################################################################################################################
./delete.sh
#########################################################################################################################


#########################################################################################################################
# Secret
#########################################################################################################################
kubectl create secret generic host-ip --from-literal=HOST_IP="$(ipconfig getifaddr en0)"
kubectl create secret generic account --from-literal=USER="ykoh" --from-literal=PASSWORD="ykoh"
#########################################################################################################################



#########################################################################################################################
# MetalLB
#########################################################################################################################
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
export ADDRESSES=`ipconfig getifaddr en0`-`ipconfig getifaddr en0`
sed -i "" "s/ADDRESSES/$ADDRESSES/" srcs/MetalLB/config.yaml
kubectl apply -f srcs/MetalLB/config.yaml
sed -i "" "s/$ADDRESSES/ADDRESSES/" srcs/MetalLB/config.yaml
#########################################################################################################################



#########################################################################################################################
# MySQL
#########################################################################################################################
# docker build -t mysql srcs/MySQL && docker run -p 3306:3306 -it mysql
# kubectl delete -f srcs/MySQL/config.yaml
docker build -t mysql srcs/MySQL
kubectl apply -f srcs/MySQL/config.yaml
#########################################################################################################################



#########################################################################################################################
# PhpMyAdmin
#########################################################################################################################
# docker build -t phpmyadmin srcs/PhpMyAdmin && docker run -p 5000:5000 -it phpmyadmin
kubectl delete -f srcs/PhpMyAdmin/config.yaml
docker build -t phpmyadmin srcs/PhpMyAdmin
kubectl apply -f srcs/PhpMyAdmin/config.yaml
#########################################################################################################################



#########################################################################################################################
# WordPress
#########################################################################################################################
# docker build -t wordpress srcs/WordPress && docker run -p 5050:5050 -it wordpress
# kubectl delete -f srcs/WordPress/config.yaml
docker build -t wordpress srcs/WordPress
kubectl apply -f srcs/WordPress/config.yaml
#########################################################################################################################



#########################################################################################################################
# Nginx
#########################################################################################################################
# docker build -t nginx srcs/Nginx && docker run -p 22:22 -it nginx
kubectl delete -f srcs/Nginx/config.yaml
docker build -t nginx srcs/Nginx
kubectl apply -f srcs/Nginx/config.yaml
#########################################################################################################################




#########################################################################################################################
# influxDB
#########################################################################################################################
# docker build -t influxdb srcs/influxDB && docker run -p 8086:8086 -it influxdb
kubectl delete -f srcs/influxDB/config.yaml
docker build -t influxdb srcs/influxDB
kubectl apply -f srcs/influxDB/config.yaml
#########################################################################################################################




#########################################################################################################################
# telegraf
#########################################################################################################################
# docker build -t telegraf srcs/telegraf && docker run -it telegraf
# kubectl delete -f srcs/telegraf/config.yaml
docker build -t telegraf srcs/telegraf
kubectl apply -f srcs/telegraf/config.yaml
#########################################################################################################################




#########################################################################################################################
# Grafana
#########################################################################################################################
# docker build -t grafana srcs/Grafana && docker run -p 3000:3000 -it grafana
# kubectl delete -f srcs/Grafana/config.yaml
docker build -t grafana srcs/Grafana
kubectl apply -f srcs/Grafana/config.yaml
#########################################################################################################################





#########################################################################################################################
# FTPS
#########################################################################################################################
# kubectl delete -f srcs/FTPS/config.yaml
docker build -t ftps srcs/FTPS
export HOST_IP=`ipconfig getifaddr en0`
sed -i "" "s/HOST_IP/$HOST_IP/" srcs/FTPS/config.yaml
kubectl apply -f srcs/FTPS/config.yaml
sed -i "" "s/$HOST_IP/HOST_IP/" srcs/FTPS/config.yaml
#########################################################################################################################



#########################################################################################################################
# Dashboard
#########################################################################################################################
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

# Creating a Service Account
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

# Creating a ClusterRoleBinding
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

# Getting a Bearer Token
echo "Bearer Token\n"
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
echo "\n"

# Commandline proxy
kill -9 $(lsof -ti :8001)
kubectl proxy &

# Dashboard URL
open "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"