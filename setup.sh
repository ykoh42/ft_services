#!/bin/bash
if [ -z "$BASH_VERSION" ]; then exec bash "$0" "$@"; exit; fi

# Delete image
# ./delete.sh

# Secret
kubectl create secret generic host-ip --from-literal=HOST_IP="$(ipconfig getifaddr en0)"
kubectl create secret generic account --from-literal=USER="ykoh" --from-literal=PASSWORD="ykoh"

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


# Nginx
docker build -t nginx srcs/Nginx
kubectl apply -f srcs/Nginx/config.yaml

