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
		docker stop $(docker ps -a -q)
		docker rm $(docker ps -a -q)
		docker rmi $(docker images -q)
status:
		@docker ps