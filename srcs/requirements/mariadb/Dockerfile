FROM debian:buster
LABEL owner="bdomitil"
WORKDIR /usr/src/app_dir
RUN apt update && apt upgrade -y && apt install -y mariadb-server vim
COPY ./tools ./
EXPOSE 3306
CMD /bin/bash start.sh