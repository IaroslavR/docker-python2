include .env

.PHONY: build all push pull clean
.DEFAULT_GOAL := build

pull:
	docker pull ${BASE_IMAGE}

build:
	docker-compose build
	docker tag ${OWNER}/${NAME}:${TAG} ${OWNER}/${NAME}:latest

push:
	docker push ${OWNER}/${NAME}:${TAG}
	docker push ${OWNER}/${NAME}:latest

clean:
	docker system prune -f


all: pull build push
