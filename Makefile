.PHONY: build push

DOCKER_IMAGE_TAG=$(shell git rev-parse --short HEAD)
REPO=renderedtext/credo

build:
	docker buildx build \
		--platform linux/amd64,linux/arm64 \
		-t $(REPO):latest .

push:
	docker tag $(REPO):latest $(REPO):$(DOCKER_IMAGE_TAG)
	docker push $(REPO):$(DOCKER_IMAGE_TAG)
	docker push $(REPO):latest

setup:
	docker run --privileged --rm tonistiigi/binfmt --install all
	docker buildx create --name mybuilder
	docker buildx use mybuilder