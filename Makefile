DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml

build:
	@sudo mkdir -p /home/fbafica/data/mariadb
	@sudo mkdir -p /home/fbafica/data/wordpress
	@sudo echo "127.0.0.1 fbafica.42.fr" >> /etc/hosts
	@docker-compose -f $(DOCKER_COMPOSE_PATH) build

up:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	@docker-compose -f $(DOCKER_COMPOSE_PATH) down

clean: SHELL := /bin/bash
clean:
	@if [[ $$(docker volume ls -q | wc -l) != 0 ]]; then\
		docker volume rm $(docker volume ls -q);\
	fi
	@sudo rm -rf /home/fbafica/
	@sudo sed -i.bak '/127.0.0.1 fbafica.42.fr/d' /etc/hosts

fclean: SHELL := /bin/bash
fclean: clean
	@if [[ $$(docker images mariadb_42_inception | wc -l) > 1 ]]; then\
		@docker rmi mariadb_42_inception;\
	fi
	@if [[ $$(docker images wordpress_42_inception | wc -l) > 1 ]]; then\
		@docker rmi wordpress_42_inception;\
	fi
	@if [[ $$(docker images nginx_42_inception | wc -l) > 1 ]]; then\
		@docker rmi nginx_42_inception;\
	fi

mariadb:
	docker exec -it mariadb bash

wordpress:
	docker exec -it wordpress sh