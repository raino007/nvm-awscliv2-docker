#Dockerfile vars
NVM_VERSION=v0.39.1
DOCKER_CLIENT_VERSION=docker-20.10.5.tgz

#vars
IMAGENAME=awscliv2-nvm-docker
IMAGEFULLNAME=raino007/awscliv2-nvm-docker:latest
.PHONY: help build push all

help:
	    @echo "Makefile arguments:"
	    @echo ""
	    @echo "IMAGEFULLNAME - Docker Repo"
	    @echo ""
	    @echo "Makefile commands:"
	    @echo "build"
	    @echo "push"
	    @echo "all"

.DEFAULT_GOAL := all

build:
	    @docker build --pull --build-arg NVM_VERSION=${NVM_VERSION} --build-arg DOCKER_CLIENT_VERSION=${DOCKER_CLIENT_VERSION} -t ${IMAGEFULLNAME} .

push:
	    @docker push ${IMAGEFULLNAME}

all: build push