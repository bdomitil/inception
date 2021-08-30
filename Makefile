up:
	docker-compose -f srcs/docker-compose.yaml up -d

down:
	 docker-compose -f srcs/docker-compose.yaml down

build :
	docker-compose -f srcs/docker-compose.yaml build
