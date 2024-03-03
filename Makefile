all: fix up

fix:
	sudo apt -y purge "^virtualbox-.*"
	sudo apt -y autoremove
	sudo apt -y install docker-compose-plugin

up:
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re: down all