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
        docker rmi srcs_mariadb srcs_nginx srcs_wordpress
        docker volume rm srcs_mariadb_volume srcs_wordpress_volume
open:
		@open -a Docker
		@echo "Open Docker"
close:
		@osascript -e 'quit app "Docker"'
		@echo "Close Docker" 		
status:
		@docker ps

restart:
		docker-compose -f ./srcs/docker-compose.yml down
		docker rmi srcs_mariadb srcs_nginx srcs_wordpress
		docker volume rm srcs_mariadb_volume srcs_wordpress_volume
		@osascript -e 'quit app "Docker"'
		@echo "Close Docker"
		@open -a Docker
		@echo "Open Docker"
		docker-compose -f ./srcs/docker-compose.yml up -d 