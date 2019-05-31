include .env

.PHONY: build all push
.DEFAULT_GOAL := all

build:
	docker pull ${BASE_IMAGE}
	docker-compose build
	docker tag ${OWNER}/${NAME}:${TAG} ${OWNER}/${NAME}:latest

push:
	docker push ${OWNER}/${NAME}:${TAG}
	docker push ${OWNER}/${NAME}:latest

all: build push
