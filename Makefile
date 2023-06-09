all: up

up:
		docker-compose -f ./Src/docker-compose.yml up -d
down:
		docker-compose -f ./Src/docker-compose.yml down
stop:
		docker-compose -f ./Src/docker-compose.yml stop
start:
		docker-compose -f ./Src/docker-compose.yml start
restart:
		docker-compose -f ./Src/docker-compose.yml stop
		docker-compose -f ./Src/docker-compose.yml up -d
clean:
		docker rmi $(docker images -q)
open:
		@open -a Docker
		@echo "Open Docker"
close:
		@osascript -e 'quit app "Docker"'
		@echo "Close Docker" 		
status:
		@docker ps