all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network ls --filter "dangling=false" --format "{{.ID}} {{.Name}}" | \
	grep -Ev "bridge|host|none" | awk '{print $$1}' | xargs -r docker network rm

#	the last two lines are to remove the networks but not the default ones(if not
#	there is a problem)


.PHONY: all re down clean
