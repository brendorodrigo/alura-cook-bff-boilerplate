SERVICE_NAME=alura-cook-bff-boilerplate

NETWORK_NAME=alura
NETWORK_ID=$(shell docker network ls -qf "name=${NETWORK_NAME}")

.PHONY: build
build:
	@docker-compose build --pull

.PHONY: network
network:
	@if [ -n "${NETWORK_ID}" ]; then \
		echo "The ${NETWORK_NAME} network already exists. Skipping..."; \
	else \
		docker network create -d bridge ${NETWORK_NAME}; \
	fi


up:
	@docker-compose up

up-silent:
	@docker-compose up -d

down:
	@docker-compose down
