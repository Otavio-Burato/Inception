all: fix

fix:
	sudo apt autoremove
	sudo apt -y install docker-compose-plugin

up:
	docker compose

down:
	docker compose