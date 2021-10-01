#!/usr/bin/make -f

PROJECT_NAME := 'Flahship store API'
FLAGSHIP_STORE_SERVICE := flagship-store-py-api
CONTAINER_NAME := flagship-store-py_api_1

FLAGSHIP_STORE_ROOT_FOLDER := $(shell pwd)
DOCKER_COMPOSE_FILE := $(FLAGSHIP_STORE_ROOT_FOLDER)/docker-compose.yaml
DOCKER_PROJECT_NAME := flagship-store-py
DOCKER_COMMAND := docker-compose -p $(DOCKER_PROJECT_NAME) -f $(DOCKER_COMPOSE_FILE)


build: ## Build project image
	$(DOCKER_COMMAND) build --no-cache

env-start: ## Start project containers defined in docker-compose
	$(DOCKER_COMMAND) up -d

env-stop: ## Stop project containers defined in docker-compose
	$(DOCKER_COMMAND) stop

env-recreate: env-stop build env-start

env-restart: env-stop env-start

bash: ## Open a bash shell in project's main container
	docker exec -it ${CONTAINER_NAME} bash
