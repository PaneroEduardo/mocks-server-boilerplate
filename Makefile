DOCKER_IMAGE_NAME ?= mocks-server-boilerplate
DOCKER_IMAGE_VERSION ?= 0.1.0

MOCKS_SERVER_PORT ?= 3100
MOCKS_ADMIN_PORT ?= 3110

define help
Usage: make <command>
Commands:
  help:                  Show this help information
  clean:				 Clean the dependencies	of the project
  install:				 Install the dependencies of the project
  run:					 Run the mocks server
  build-image:		     Build a docker image of the mocks server
  run-image:			 Run the docker image to serve the mocks server
  stop-image:			 Stop the mocks server that runs in a container
  open-admin-swagger:	 Open the open admin page swagger in a browser
endef
export help

.PHONY: help
help:
	@echo "$$help"

.PHONY: clean
clean:
	$(info) "Cleaning the project"
	rm -rf node_modules

.PHONY: install
install:
	$(info) "Installing the project dependencies"
	npm install

.PHONY: run
run:
	$(info) "Installing the project dependencies"
	npm start

.PHONY: build-image
build-image:
	$(info) "Build a docker image for the mocks server"
	docker build -f ./Dockerfile --no-cache --label build=$(DOCKER_IMAGE_VERSION) -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) .
	docker tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

.PHONY: run-image
run-image:
	$(info) "Run the image built in a new container"
	docker run -d -p $(MOCKS_SERVER_PORT):3100 -p $(MOCKS_ADMIN_PORT):3110 --name $(DOCKER_IMAGE_NAME) $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

.PHONY: stop-image
stop-image:
	$(info) "Stop the container that runs the mocks server"
	docker stop $(DOCKER_IMAGE_NAME)

.PHONY: open-admin-swagger
open-admin-swagger:
	$(info) "Open in the browser the admin page swagger"
	xdg-open "http://localhost:$(MOCKS_ADMIN_PORT)/docs"


info := @printf "\033[32;01m%s\033[0m\n"
