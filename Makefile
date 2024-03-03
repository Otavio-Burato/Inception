all: fix

fix:
	sudo apt -y purge "^virtualbox-.*"
	sudo apt -y autoremove
	sudo apt -y install docker-compose-plugin

up:
	docker compose

down:
	docker compose