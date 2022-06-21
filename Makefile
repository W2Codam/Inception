# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: lde-la-h <lde-la-h@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/06/09 07:50:32 by lde-la-h      #+#    #+#                  #
#    Updated: 2022/06/21 11:33:11 by lde-la-h      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

include ./srcs/.env
export $(shell sed 's/=.*//' ./srcs/.env)

# Terminal colors
GREEN	= \033[32;1m
RED		= \033[31;1m
BOLD	= \033[1m
RESET	= \033[0m

# Variables
COMPOSE := srcs/docker-compose.yml

up:
	@printf "$(GREEN)$(BOLD)\rDocker: $@\n$(RESET)"
	@docker-compose -f $(COMPOSE) up -d --build --remove-orphans

down:
	@printf "$(GREEN)$(BOLD)\rDocker: $@\n$(RESET)"
	@docker-compose -f $(COMPOSE) down -t 2

fdown:
	@docker-compose -f $(COMPOSE) down -v

clean:
	@docker-compose -f $(COMPOSE) down --rmi all

.PHONY: up down fdown clean
