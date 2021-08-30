FROM debian:buster
LABEL owner="bdomitil"
WORKDIR /usr/src/app_dir
RUN apt update && apt upgrade -y
RUN apt install nginx openssl -y
COPY ./tools ./
RUN /bin/bash start.sh
CMD nginx -g 'daemon off;'
EXPOSE 443