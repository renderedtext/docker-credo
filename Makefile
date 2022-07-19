.PHONY: build push

DOCKER_IMAGE_TAG=$(shell git rev-parse --short HEAD)

build:
	docker build -t renderedtext/credo .

push:
	docker tag renderedtext/credo:latest renderedtext/credo:$(DOCKER_IMAGE_TAG)
	docker push renderedtext/credo:$(DOCKER_IMAGE_TAG)
	docker push renderedtext/credo:latest

setup:
	docker run --privileged --rm tonistiigi/binfmt --install all
	docker buildx create --name mybuilder
	docker buildx use mybuilder