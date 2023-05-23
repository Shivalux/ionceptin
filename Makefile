# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sharnvon <sharnvon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/13 20:59:35 by sharnvon          #+#    #+#              #
#    Updated: 2023/05/20 04:00:26 by sharnvon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= inception
COMPOSE = docker compose
NGINX	= nginx
MARIA	= mariadb
WPRES	= wordpress
REDIS	= redis
ADMIN	= adminer
STWEB	= static_webpage
VSFTP	= ftp_server
PROME	= prometheus
YML		= ./srcs/docker-compose.yml
DATAV	= database
WEBV	= wordpress
TAG_MENDA	= inception
TAG_BONUS	= inception_bonus
MOUNT_PATH	= /home/sharnvon/data/

NORMAL	= \033[0m
GREEN	= \033[1;32m
ORANGE	= \033[1;33m
BLUE	= \033[1;36m
RED		= \033[1;31m


all: $(NAME)
	$(COMPOSE) -f $(YML) up -d --quiet-pull --build
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
up:
	$(COMPOSE) -f $(YML) up -d --quiet-pull --build
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
.PHONY: all up

console: $(NAME)
	$(COMPOSE) -f $(YML) up --quiet-pull --build
.PHONY: console

$(NAME):
	@mkdir -p $(MOUNT_PATH)
	@mkdir -p $(MOUNT_PATH)database/
	@mkdir -p $(MOUNT_PATH)wordpress/
	@echo "$(GREEN)-----:: success :: make directories ::-----$(NORMAL)"

list:
	@echo "$(GREEN)-----:: list :: all containers ::-----$(NORMAL)"
	@docker ps -a
	@echo
	@echo "$(GREEN)-----:: list :: all images ::-----$(NORMAL)"
	@docker images
	@echo
	@echo "$(GREEN)-----:: list :: all networks ::-----$(NORMAL)"
	@docker network list
	@echo
	@echo "$(GREEN)-----:: list :: all volumes ::-----$(NORMAL)"
	@docker volume list
.PHONY: list

clean:
	$(COMPOSE) -f $(YML) down
	@echo "$(BLUE)-----:: success :: all containers are down ::-----$(NORMAL)"
down:
	$(COMPOSE) -f $(YML) down
	@echo "$(BLUE)-----:: success :: all containers are down ::-----$(NORMAL)"
.PHONY: clean down

fclean: clean
	@sudo rm -rf $(MOUNT_PATH)
	@echo "$(ORANGE)-----:: fclean :: all directories are deleted ::-----$(NORMAL)"
	docker volume rm $(DATAV)
	docker volume rm $(WEBV)
	@echo "$(ORANGE)-----:: fclean :: all volumes are deleted ::-----$(NORMAL)"
	docker rmi $(MARIA):$(TAG_MENDA)
	docker rmi $(WPRES):$(TAG_MENDA)
	docker rmi $(NGINX):$(TAG_MENDA)
	docker rmi $(REDIS):$(TAG_BONUS)
	docker rmi $(ADMIN):$(TAG_BONUS)
	docker rmi $(STWEB):$(TAG_BONUS)
	docker rmi $(VSFTP):$(TAG_BONUS)
	docker rmi $(PROME):$(TAG_BONUS)
	@echo "$(RED)-----:: fclean :: all images are deleted ::-----$(NORMAL)"
.PHONY: fclean

re: fclean all
.PHONY: re

bonus: all
.PHONY: bonus
