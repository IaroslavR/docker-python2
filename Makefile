.DEFAULT: build

build: Dockerfile
	docker build -t iarruss/builder:latest .
