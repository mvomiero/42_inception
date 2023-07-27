FROM debian:buster

# UPDATE PACKAGE MANAGER AND INSTALL MARIADB SERVER 
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

# CREATE && CHMOD THE SCRIPT TO CONFIGURE DB
COPY ./tools/script.sh .

RUN chmod +x script.sh

# RUN THE SCRIPT
ENTRYPOINT  [ "./script.sh" ] 