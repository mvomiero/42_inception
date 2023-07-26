# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvomiero <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/23 12:38:32 by mvomiero          #+#    #+#              #
#    Updated: 2023/07/26 08:46:46 by mvomiero         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p /home/osboxes/data/mysql
	@mkdir -p /home/osboxes/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build	

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker compose -f ./srcs/docker-compose.yml down -v
	@docker rmi -f $$(docker images -qa)
	@rm -rf /home/osboxes/data/mysql
	@rm -rf /home/osboxes/data/wordpress


.PHONY: all re down clean