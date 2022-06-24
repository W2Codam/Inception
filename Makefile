# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: lde-la-h <lde-la-h@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/06/09 07:50:32 by lde-la-h      #+#    #+#                  #
#    Updated: 2022/06/24 12:03:02 by lde-la-h      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#NOTE: Before you start thinking and looking where I implemented the domain
# 'lde-la-h.42.fr', in short, I just didn't bother, doing this would require
# a whole goddamn docker container with this repo in it and running it or
# having it run a vm and install docker there, in short, N O. Its too much effort
# just so you can edit the /etc/hosts file by adding 127.0.0.1 www.lde-la-h.42.fr in there.
# GTFO

# Go to: http://localhost:443/ This is where you static website should be!

include ./srcs/.env
export $(shell sed 's/=.*//' ./srcs/.env)

# Terminal colors
GREEN	= \033[32;1m
RED		= \033[31;1m
BOLD	= \033[1m
RESET	= \033[0mls

# Variables
COMPOSE := srcs/docker-compose.yml

up:
	@printf "$(GREEN)$(BOLD)\rDocker: $@\n$(RESET)"
	@docker-compose -f $(COMPOSE) up -d --build --remove-orphans

down:
	@printf "$(GREEN)$(BOLD)\rDocker: $@\n$(RESET)"
	@docker-compose -f $(COMPOSE) down -t 2

clean:
	@docker-compose -f $(COMPOSE) down --rmi all

re:
#@docker stop all
#@docker rm all
#@docker rmi -f all
	@docker-compose -f $(COMPOSE) build --no-cache && docker-compose -f $(COMPOSE) up -d --force-recreate

.PHONY: up down fdown clean
