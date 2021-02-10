# Delete image
# ./delete.sh

# Secret
kubectl create secret generic host-ip --from-literal=HOST_IP="$(ipconfig getifaddr en0)"
kubectl create secret generic account --from-literal=USER="ykoh" --from-literal=PASSWORD="ykoh"

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

kubectl proxy &


# MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
export ADDRESSES=`ipconfig getifaddr en0`-`ipconfig getifaddr en0`
sed -i "" "s/ADDRESSES/$ADDRESSES/" srcs/MetalLB/config.yaml
kubectl apply -f srcs/MetalLB/config.yaml
sed -i "" "s/$ADDRESSES/ADDRESSES/" srcs/MetalLB/config.yaml


# MySQL
kubectl delete -f srcs/MySQL/config.yaml
docker build -t mysql srcs/MySQL
kubectl apply -f srcs/MySQL/config.yaml

# PhpMyAdmin
kubectl delete -f srcs/phpmyadmin/config.yaml
docker build -t phpmyadmin srcs/PhpMyAdmin
kubectl apply -f srcs/phpmyadmin/config.yaml

# WordPress
# docker build -t wordpress srcs/WordPress && docker run -p 5050:5050 -it wordpress
kubectl delete -f srcs/WordPress/config.yaml
docker build -t wordpress srcs/WordPress
kubectl apply -f srcs/WordPress/config.yaml

# Nginx
kubectl delete -f srcs/Nginx/config.yaml
docker build -t nginx srcs/Nginx
kubectl apply -f srcs/Nginx/config.yaml




# Getting a Bearer Token
printf "Bearer Token\n\n"
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
printf "\n"

sleep 3

# echo "open following URL"
# echo "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default"
open "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default"
############################################################################

