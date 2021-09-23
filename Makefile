DOCKER_TAG=jiunjiunma/liveproject-tracing:v1.2
TRACING_IMAGE := $(shell docker image ls | grep 'jiunjiunma/liveproject-tracing' | awk '{ print $$3 }') 
JAEGER_IMAGE := $(shell docker image ls | grep 'jaegertracing/all-in-one' | awk '{ print $$3 }') 

image: package
	docker build -t $(DOCKER_TAG) .
package:
	cd tracing-demo && mvn package
run: run-tracing run-jaeger
run-tracing: image
	docker run -d -p 8080:8080 --rm --name tracing $(DOCKER_TAG)
run-jaeger:
	docker run -d --name jaeger --rm -p 14268:14268 -p 16686:16686 jaegertracing/all-in-one:1.22
clean: clean-jaeger clean-tracing
clean-tracing: 
	docker stop tracing && docker rmi ${TRACING_IMAGE}
clean-jaeger: 
	docker stop jaeger && docker rmi ${TRACING_IMAGE}
