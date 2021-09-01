FROM debian:buster
LABEL owner="bdomitil"
WORKDIR /usr/src/app_dir
RUN apt update && apt upgrade -y  \
 && apt install -y vim wget curl \
 && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
 && apt-get install -y nodejs git
COPY ./tools ./
EXPOSE 3000
CMD /bin/bash start.sh