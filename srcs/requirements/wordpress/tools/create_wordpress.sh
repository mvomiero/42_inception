#!/bin/sh

# Check if wp-config.php exists
if [ -f ./wp-config.php ]
then
    echo "WordPress already downloaded"
else

    # Download WordPress and all config files
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress

    # Import env variables in the config file
    sed -i "s/username_here/$WP_ADMIN/g" wp-config-sample.php
    sed -i "s/password_here/$WP_ADMIN_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php


	wp core install --url=mvomiero.42.fr \
                --title=lampstack \
                --admin_name=$WP_ADMIN \
                --admin_password=$WP_ADMIN_PASSWORD \
                --admin_email=colocomarco@gmail.com \
                --allow-root \

	wp user create $WP_USER $WP_USER@example.com  --user_pass=$WP_USER_PASSWORD --allow-root

fi

exec "$@"
