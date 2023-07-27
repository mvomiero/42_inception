first make
RUN /usr/local/bin/create_wordpress.sh
#ENTRYPOINT

second make
RUN /usr/local/bin/create_wordpress.sh
ENTRYPOINT

to ssh

hostname -I, pick the first

connect from the host with 
ssh user@ip -p 4242

to copy a folder with ssh
scp -r -P 4242 my_folder osboxes@10.15.247.178:/home/osboxes/

!! commented out !!

wordpress.sql

!!!! mariadb export .sql

docker exec -it mariadb /bin/bash
apt-get update
apt-get install -y mysql-client
mysql -u root -p
GRANT ALL PRIVILEGES ON mariadb.* TO 'mvomiero'@'%';
FLUSH PRIVILEGES;
EXIT;
mysqldump -u mvomiero -p wordpress > wordpress.sql
exit
docker cp mariadb:worpress.sql ./srcs/requirements/mariadb/conf/wordpress.sql

docker exec -it containername bash

## Nginx

#### Dockerfile

The Dockerfile sets up a container with Nginx, installs OpenSSL to generate a self-signed SSL certificate, copies a custom Nginx configuration file, and exposes port 443 for HTTPS traffic. The Nginx server will be started in the foreground to serve the content over HTTPS on port 443. The self-signed certificate is not suitable for production use, and it's recommended to use a valid SSL certificate from a trusted certificate authority for secure and encrypted communication in production environments, but it's fine just for testing purpose.

#### nginx.conf

The nginx.conf file configures an Nginx server to handle HTTPS traffic on port 443 with SSL/TLS encryption. It specifies a domain name (mvomiero.42.fr) and points to SSL certificate and key files. The server is set to serve static files from the /var/www/html directory and process PHP files via a FastCGI server listening at wordpress:9000. It also specifies the default index files to try and defines some FastCGI parameters for PHP handling.

##### FastCGI
FastCGI (Fast Common Gateway Interface) is a protocol designed to improve the performance and efficiency of CGI (Common Gateway Interface) scripts in web servers. CGI is a standard method for web servers to interact with external programs to process dynamic content and generate HTML pages.

## Wordpress

#### Dockerfile

Installs extensions and runs the script.

#### Script

 this script installs necessary tools, downloads and configures WordPress, sets up the database, and starts PHP-FPM to serve the WordPress application.

## MariaDB

#### Dockerfile

Installs extensions and runs the script.

#### Script

Configuration of mysql

