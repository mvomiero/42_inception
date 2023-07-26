#!/bin/bash

# Script to update the WordPress website .sql file

# Function to execute commands in the mariadb container
execute_in_mariadb() {
  docker exec -i mariadb "$@"
}

# Full path to the .env file
ENV_FILE="./srcs/.env"  # Replace this with the actual path to your .env file

# Read the password from the .env file
source "$ENV_FILE"

# Install mysql-client in the mariadb container
execute_in_mariadb apt-get update
execute_in_mariadb apt-get install -y default-mysql-client

# Grant privileges to the specified user
execute_in_mariadb mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;"

# Dump the database
execute_in_mariadb mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" wordpress > ./srcs/requirements/mariadb/conf/wordpress.sql

# Exit from mariadb container
exit
