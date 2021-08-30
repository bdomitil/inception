FROM debian:buster
LABEL owner="bdomitil"
WORKDIR /usr/src/app_dir
RUN apt update && apt upgrade -y && apt install -y vim wget curl vsftpd
COPY ./tools ./
EXPOSE 20
CMD /bin/bash start.sh