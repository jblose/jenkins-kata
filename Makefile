CONT:=$(shell type -p podman || echo docker)
ifeq (, $(CONT) && $(shell which docker))
	$(error "No Containerization tool podman/docker available")
endif

build:
	$(CONT) build -t jenkins-kata .

run: build
	$(CONT) run -p 8080:8080 jenkins-kata

up: build
	docker-compose up
