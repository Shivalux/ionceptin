COMPOSE = docker-compose
NGINX	= nginx
MARIA	= mariadb
WPRES	= wordpress
YMAL	= ./srcs/docker-compose.yml
DATAV	= database
WEBV	= wordpress

NORMAL	= \033[0m
GREEN	= \033[1;32m
ORANGE	= \033[1;33m
BLUE	= \033[1;36m
RED		= \033[1;31m

all:
	$(COMPOSE) -f $(YMAL) up -d
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
up:
	$(COMPOSE) -f $(YMAL) up -d
	@echo "$(GREEN)-----:: success :: all containers are up ::-----$(NORMAL)"
.PHONY: all up

console:
	$(COMPOSE) -f $(YMAL) up
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
	$(COMPOSE) -f $(YMAL) down
	@echo "$(BLUE)-----:: success :: all containers are down ::-----$(NORMAL)"
down:
	$(COMPOSE) -f $(YMAL) down
	@echo "$(BLUE)-----:: success :: all containers are down ::-----$(NORMAL)"
.PHONY: clean down

fclean: clean
	docker rmi srcs-$(NGINX) srcs-$(WPRES) srcs-$(MARIA)
	@echo "$(ORANGE)-----:: fclean :: all images are deleted ::-----$(NORMAL)"
	docker volume rm $(DATAV) $(WEBV)
	@echo "$(RED)-----:: fclean :: all volumes are deleted ::-----$(NORMAL)"
.PHONY: fclean

re: fclean all
.PHONY: re

