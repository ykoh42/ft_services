./delete.sh

# MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
export HOST_IP=`ipconfig getifaddr en0`-`ipconfig getifaddr en0`
sed -i "" "s/HOST_IP/$HOST_IP/" srcs/MetalLB/config.yaml
kubectl apply -f srcs/MetalLB/config.yaml
sed -i "" "s/$HOST_IP/HOST_IP/" srcs/MetalLB/config.yaml


# PhpMyAdmin
# docker run -p 5000:5000 -it phpmyadmin
docker build -t phpmyadmin srcs/PhpMyAdmin
kubectl apply -f srcs/phpmyadmin/config.yaml

# WordPress
# docker run -p 5050:5050 -it wordpress
kubectl delete -f srcs/WordPress/config.yaml
docker build -t wordpress srcs/WordPress
kubectl apply -f srcs/WordPress/config.yaml

# Nginx
# docker run -p 80:80 -p 443:443 -p 22:22 -p 5000:5000 -p 5050:5050 -d nginx
kubectl delete -f srcs/Nginx/config.yaml
docker build -t nginx srcs/Nginx
kubectl apply -f srcs/Nginx/config.yaml

# # docker build -t mysql srcs/MySQL
# # docker run -p 3306:3306 -it mysql

docker build -t ftps srcs/FTPS
# docker run -p 20:20 -p 21:21 -p 20020:20020 -p 20021:20021 -it ftps
kubectl apply -f srcs/FTPS/config.yaml


# # docker build -t grafana srcs/Grafana
# # docker run -p 3000:3000 -it grafana

# # docker build -t influxdb srcs/influxDB
# # docker run -p 8086:8086 -it influxdb


############################################################################
# Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

# Creating sample user

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

printf "Bearer Token\n\n"
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
printf "\n\n"

kubectl proxy &

echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo "0"
sleep 1

open "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default"
############################################################################



