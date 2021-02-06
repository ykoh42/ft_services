# 도커 모든 컨테이너 삭제
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# 도커 이미지 삭제
docker rmi $(docker images -q) 

kubectl delete -f srcs/phpmyadmin/config.yaml
kubectl delete -f srcs/WordPress/config.yaml
kubectl delete -f srcs/Nginx/config.yaml