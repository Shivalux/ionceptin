NAME	= inception
COMPOSE = docker-compose
NGINX	= nginx
MARIA	= mariadb
WPRES	= wordpress
YML		= ./srcs/docker-compose.yml
DATAV	= database
WEBV	= wordpress

NORMAL	= \033[0m
GREEN	= \033[1;32m
ORANGE	= \033[1;33m
BLUE	= \033[1;36m
RED		= \033[1;31m

$(NAME):
	# mkdir -p $HOME/data/
	# mkdir -p $HOME/data/database/
	# mkdir -p $HOME/data/wordpress/

all: $(NAME)
	$(COMPOSE) -f $(YML) up -d 
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
up:
	$(COMPOSE) -f $(YML) up -d
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
force:
	$(COMPOSE) -f $(YML) up -d --build
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
.PHONY: all up

console:
	$(COMPOSE) -f $(YML) up
.PHONY: console

check:
	@docker ps -a
	@echo
	@docker images
	@echo
	@docker network list
	@echo
	@docker volume list
.PHONY: check

clean:
	$(COMPOSE) -f $(YML) down
	@echo "$(BLUE)-----:: success :: all containers are down ::-----$(NORMAL)"
down:
	$(COMPOSE) -f $(YML) down
	@echo "$(BLUE)-----:: success :: all containers are down ::-----$(NORMAL)"
.PHONY: clean down

fclean: clean
	rm -rf /Users/shivarakii/Documents/42_coding/inception/srcs/data/database/*
	rm -rf /Users/shivarakii/Documents/42_coding/inception/srcs/data/wordpress/*
	docker volume rm $(DATAV)
	docker volume rm $(WEBV)
	# rm -rf /$HOME/data/database/*
	# rm -rf /$HOME/data/wordpress/*
	@echo "$(ORANGE)-----:: fclean :: all volumes are deleted ::-----$(NORMAL)"
	docker rmi srcs-$(MARIA)
	docker rmi srcs-$(WPRES)
	docker rmi srcs-$(NGINX)
	@echo "$(RED)-----:: fclean :: all images are deleted ::-----$(NORMAL)"
.PHONY: fclean

re: fclean all
.PHONY: re

