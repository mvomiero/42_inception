#!/bin/bash

# Script to update the WordPress website .sql file

# Function to execute commands in the mariadb container
execute_in_mariadb() {
  docker exec -i mariadb "$@"
}

# Install mysql-client in the mariadb container
execute_in_mariadb apt-get update
execute_in_mariadb apt-get install -y default-mysql-client

# Grant privileges to the specified user
execute_in_mariadb mysql -u root -p -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$1'@'%' IDENTIFIED BY '$2'; FLUSH PRIVILEGES;"

# Dump the database
execute_in_mariadb mysqldump -u "$1" -p wordpress > ./srcs/requirements/mariadb/conf/wordpress.sql

# Exit from mariadb container
exit
