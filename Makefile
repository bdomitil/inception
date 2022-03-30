all: build up

up:
	docker-compose -f srcs/docker-compose.yaml up -d

down:
	 docker-compose -f srcs/docker-compose.yaml down

build :
	mkdir -p /home/ubuntu/volume
	mkdir -p /home/ubuntu/db_vol
	mkdir -p /home/ubuntu/adminer_vol
	docker-compose -f srcs/docker-compose.yaml build

clean-vol:
	sudo rm -rf ~/adminer_vol/* ~/db_vol/* ~/volume/*
re:	clean-vol down build up