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
	@sudo rm -rf /home/osboxes/data/mysql
	@sudo rm -rf /home/osboxes/data/wordpress

update_sql:
	./update_sql.sh
#	docker cp mariadb:wordpress.sql ./srcs/requirements/mariadb/conf/wordpress.sql


.PHONY: all re down clean
