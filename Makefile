all: up

up:
		docker-compose -f ./srcs/docker-compose.yml up -d
down:
		docker-compose -f ./srcs/docker-compose.yml down
stop:
		docker-compose -f ./srcs/docker-compose.yml stop
start:
		docker-compose -f ./srcs/docker-compose.yml start
clean: down
		docker rmi wordpress nginx mariadb
		docker volume rm mariadb_volume wordpress_volume
		@rm -r /Users/qfrederi/Inception/data/mariadb/*
		@echo "Data mariadb cleaned"
		@rm -r /Users/qfrederi/Inception/data/wordpress/*
		@echo "Data wordpress cleaned"
		@osascript -e 'quit app "Docker"'
		@echo "Close Docker"
open:
		@open -a Docker
		@echo "Open Docker"
close:
		@osascript -e 'quit app "Docker"'
		@echo "Close Docker" 		
status:
		@docker ps