all: docker-build k8s-deployment

docker-build:
	docker build -t kafka-producer kafka-producer
	docker build -t kafka-consumer kafka-consumer

k8s-deployment:
	kubectl apply -f kafka-producer/deployment.yaml
	kubectl apply -f kafka-consumer/deployment.yaml

k8s-delete-deployment:
	kubectl delete -f kafka-producer/deployment.yaml
	kubectl delete -f kafka-consumer/deployment.yaml

clean: k8s-delete-deployment

