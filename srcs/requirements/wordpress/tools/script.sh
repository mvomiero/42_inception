#!/bin/bash

mkdir /run/php/

cd /var/www/html

# curl (short for "Client URL") is a command line tool that enables data transfer over various network protocols.
# install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# after donwload wp-cli we should give him all permissions
chmod +x wp-cli.phar

# now we will moves the WP-CLI tool to /usr/local/bin/ directory, for making it available system-wide as the wp command.
mv wp-cli.phar /usr/local/bin/wp

# changes the owner of the /var/www/html/ directory and all its subdirectories to www-data:www-data. www-data is the user and group commonly used by web servers to access files.
chown -R www-data:www-data /var/www/html/

# change the permissions of that directory and their subdirs to make that directories readable, writable, and executable by the owner (www-data) and readable and executable by others.
chmod -R 755 /var/www/html/

# change working direcotry
cd /var/www/html/

# install and configure wordpress
wp core download --allow-root

# edit on name of wp-config
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# default socket file path is replaced with the port 9000 because the fastcgi_pass directive in the mginx conf_file is set to use port 9000 to communicate with the PHP-FPM server.
sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf

# set the database
sed -i 's/database_name_here/'$MYSQL_DATABASE'/g' /var/www/html/wp-config.php

# set the username
sed -i 's/username_here/'$MYSQL_USER'/g' /var/www/html/wp-config.php

# set the pass of the user
sed -i 's/password_here/'$MYSQL_PASSWORD'/g' /var/www/html/wp-config.php

# set The hostname of the That base
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '$HOST' );/g" /var/www/html/wp-config.php


start_php_fpm() {
    php-fpm7.3 -F
}

# Function to run WordPress configuration commands
configure_wordpress() {
    # Sleep to give PHP-FPM a moment to start (adjust as needed)
    sleep 5

    wp core install --url=$URL \
                --title=$TITLE \
                --admin_name=$ADMIN_USER \
                --admin_password=$ADMIN_PASSWORD \
                --admin_email=$ADMIN_EMAIL \
                --allow-root \

	wp user create $WP_USER $WP_USER_EMAIL  --user_pass=$WP_USER_PASSWORD --allow-root
}

# Start PHP-FPM in the background
start_php_fpm &

# Run WordPress configuration commands
configure_wordpress &

# Use wait to wait for both background processes to complete before moving on
wait