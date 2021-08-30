FROM debian:buster
LABEL owner="bdomitil"
WORKDIR /usr/src/app_dir
RUN apt update && apt upgrade -y && apt install -y vim wget curl redis-server
COPY ./tools ./
CMD /bin/bash start.sh