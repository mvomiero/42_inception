all:
	@mkdir -p /home/osboxes/data/mysql
	@mkdir -p /home/osboxes/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build	

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q)
	@sudo rm -rf /home/osboxes/data/mysql
	@sudo rm -rf /home/osboxes/data/wordpress

#clean:
#	@docker compose -f ./srcs/docker-compose.yml down -v
#	@docker rmi -f $$(docker images -qa)
#	@sudo rm -rf /home/osboxes/data/mysql
#	@sudo rm -rf /home/osboxes/data/wordpress

update_sql:
	./update_sql.sh
#	docker cp mariadb:wordpress.sql ./srcs/requirements/mariadb/conf/wordpress.sql

test_connection:
	-curl -I  https://mvomiero.42.fr
	-curl -I  http://mvomiero.42.fr
	-curl -I  http://mvomiero.42.fr:80

prune:
	@docker system prune --all --force
	@echo "\033[1m\033[31mCACHE REMOVED\033[1m"


.PHONY: all re down clean