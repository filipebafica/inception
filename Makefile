DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml

build:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) build

up:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) down

# clean: SHELL := /bin/bash
# clean:
# 	@if [[ $$(docker images -q | wc -l) != 0 ]]; then\
# 		docker rmi $$(docker images -q);\
# 	fi
clean:
	docker rmi mariadb_42_inception
	docker rmi wordpress_42_inception
	docker rmi nginx_42_inception

mariadb:
	docker exec -it mariadb bash

wordpress:
	docker exec -it wordpress sh