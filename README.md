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


