
FROM debian:bullseye

# Update package manager and install MariaDB server
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

# Copy the script to configure the database
COPY ./tools/mariadb.sh .

# Make the script executable
RUN chmod +x mariadb.sh

# Start the MySQL service on container startup
ENTRYPOINT ["./mariadb.sh"]

