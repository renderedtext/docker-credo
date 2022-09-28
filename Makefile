.PHONY: build push

DOCKER_IMAGE_TAG=$(shell git rev-parse --short HEAD)
ELIXIR_IMAGE_TAG?=1.13.4-alpine

build:
	docker build -t renderedtext/credo --build-arg ELIXIR_IMAGE_TAG=$(ELIXIR_IMAGE_TAG) .

push:
	docker tag renderedtext/credo:latest renderedtext/credo:elixir-$(ELIXIR_IMAGE_TAG)
	docker push renderedtext/credo:elixir-$(ELIXIR_IMAGE_TAG)

setup:
	docker run --privileged --rm tonistiigi/binfmt --install all
	docker buildx create --name mybuilder
	docker buildx use mybuilder
