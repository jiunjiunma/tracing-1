DOCKER_TAG=jiunjiunma/liveproject-tracing:v1.1
IMAGE := $(shell docker image ls | grep 'jiunjiunma/liveproject-tracing' | awk '{ print $$3 }') 

image: package
	docker build -t $(DOCKER_TAG) .
package:
	cd tracing-demo && mvn package
run: image
	docker run -d -p 8080:8080 --rm --name tracing $(DOCKER_TAG)
clean: 
	docker stop tracing && docker rmi ${IMAGE}
