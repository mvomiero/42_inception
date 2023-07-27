FROM debian:buster

RUN apt-get  update && apt-get  upgrade -y && apt-get  install curl -y\
    && apt-get install -y php php-curl php-mysql && apt-get install -y php7.3-fpm

COPY /tools/script.sh .

RUN  chmod +x script.sh

ENTRYPOINT  [ "./script.sh" ] 
