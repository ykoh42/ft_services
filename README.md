# k8s 환경 구축  
1. Docker Desktop 설치
	```
	https://www.docker.com/get-started
	```
2. k8s 로컬 실행 환경 설정

	```
	docker > preferences > Kubernetes > Enable Kubernetes > Apply & Restart
	```

# MetalLB 설정

1. MetalLB 설치

	setup.sh
	```shell
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
	# On first install only
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	```

2. Layer 2 설정

	srcs/MetalLB/config.yaml
	```yaml
	apiVersion: v1
	kind: ConfigMap
	metadata:
	namespace: metallb-system
	name: config
	data:
	config: |
		address-pools:
		- name: default
		protocol: layer2
		addresses:
		- 192.168.0.2-192.168.0.2 # ipconfig getifaddr en0
	```
