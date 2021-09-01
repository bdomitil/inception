FROM debian:buster
LABEL owner="bdomitil"
WORKDIR /usr/src/app_dir
RUN apt update && apt upgrade -y && apt install -y vim wget curl php7.3 php-mysql php7.3-cli php7.3-fpm php7.3-opcache php7.3-curl php7.3-mbstring php7.3-zip php7.3-xml  php-redis\
&& mkdir -p /var/www/html/wordpress \
   && bash /etc/init.d/php7.3-fpm start \
  && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY ./tools ./
EXPOSE 9000
CMD /bin/bash start.sh