DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml

build:
	@sudo echo "127.0.0.1 fbafica.42.fr" >> /etc/hosts
	@docker-compose -f $(DOCKER_COMPOSE_PATH) build

up:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) down

clean:
	@sudo sed -i.bak '/127.0.0.1 fbafica.42.fr/d' /etc/hosts

fclean: clean
	@docker rmi mariadb_42_inception
	@docker rmi wordpress_42_inception
	@docker rmi nginx_42_inception

mariadb:
	docker exec -it mariadb bash

wordpress:
	docker exec -it wordpress sh