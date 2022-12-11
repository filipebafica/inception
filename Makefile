DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml

build:
	@docker compose -f $(DOCKER_COMPOSE_PATH) build

up:
	@docker compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	@docker compose -f $(DOCKER_COMPOSE_PATH) down

clean: SHELL := /bin/bash
clean:
	@if [[ $$(docker images -q | wc -l) != 0 ]]; then\
		docker rmi $$(docker images -q);\
	fi