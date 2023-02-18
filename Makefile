DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml
MARIA_DB_IMAGE = mariadb
WORDPRESS_IMAGE = wordpress
NGINX_IMAGE = nginx

build:
	@sudo mkdir -p /home/fbafica/data/mariadb
	@sudo mkdir -p /home/fbafica/data/wordpress
	@sudo chmod a+w /etc/hosts
	@sudo echo "127.0.0.1 fbafica.42.fr" >> /etc/hosts
	@docker-compose -f $(DOCKER_COMPOSE_PATH) build

up:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) down

clean: SHELL := /bin/bash
clean:
	@if [[ $$(docker volume ls -q | wc -l) != 0 ]]; then\
		docker volume rm $$(docker volume ls -q);\
	fi
	@sudo rm -rf /home/fbafica/
	@sudo sed -i.bak '/127.0.0.1 fbafica.42.fr/d' /etc/hosts

fclean: SHELL := /bin/bash
fclean: clean
	@if [[ $$(docker images $(MARIA_DB_IMAGE) | wc -l) > 1 ]]; then\
		docker rmi $(MARIA_DB_IMAGE);\
	fi
	@if [[ $$(docker images $(WORDPRESS_IMAGE) | wc -l) > 1 ]]; then\
		docker rmi $(WORDPRESS_IMAGE);\
	fi
	@if [[ $$(docker images $(NGINX_IMAGE) | wc -l) > 1 ]]; then\
		docker rmi $(NGINX_IMAGE);\
	fi

mariadb:
	docker exec -it mariadb bash

wordpress:
	docker exec -it wordpress sh