# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sharnvon <sharnvon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/13 20:59:35 by sharnvon          #+#    #+#              #
#    Updated: 2023/05/17 16:02:48 by sharnvon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= inception
COMPOSE = docker-compose
NGINX	= nginx
MARIA	= mariadb
WPRES	= wordpress
REDIS	= redis
ADMIN	= adminer
STWEB	= static_webpage
VSFTP	= ftp_server
YML		= ./srcs/docker-compose.yml
DATAV	= database
WEBV	= wordpress

NORMAL	= \033[0m
GREEN	= \033[1;32m
ORANGE	= \033[1;33m
BLUE	= \033[1;36m
RED		= \033[1;31m

$(NAME):
	# mkdir /Users/shivarakii/Documents/42_coding/inception/srcs/data
	mkdir -p /Users/shivarakii/Documents/42_coding/inception/srcs/data/database
	mkdir -p /Users/shivarakii/Documents/42_coding/inception/srcs/data/wordpress
	# mkdir -p $HOME/data/
	# mkdir -p $HOME/data/database/
	# mkdir -p $HOME/data/wordpress/

all: $(NAME)
	$(COMPOSE) -f $(YML) up -d up
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
up:
	$(COMPOSE) -f $(YML) up -d up
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
.PHONY: all up

console:
	mkdir -p /Users/shivarakii/Documents/42_coding/inception/srcs/data
	mkdir -p /Users/shivarakii/Documents/42_coding/inception/srcs/data/database
	mkdir -p /Users/shivarakii/Documents/42_coding/inception/srcs/data/wordpress
	$(COMPOSE) -f $(YML) up --quiet-pull --build
.PHONY: console

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
	rm -rf /Users/shivarakii/Documents/42_coding/inception/srcs/data/
	# rm -rf /$HOME/data/
	docker volume rm $(DATAV)
	docker volume rm $(WEBV)
	@echo "$(ORANGE)-----:: fclean :: all volumes are deleted ::-----$(NORMAL)"
	docker rmi $(MARIA)
	docker rmi $(WPRES)
	docker rmi $(NGINX)
	docker rmi $(REDIS)
	docker rmi $(ADMIN)
	docker rmi $(STWEB)
	docker rmi $(VSFTP)
	@echo "$(RED)-----:: fclean :: all images are deleted ::-----$(NORMAL)"
.PHONY: fclean

re: fclean console #all
.PHONY: re

bonus: all
.PHONY: bonus
