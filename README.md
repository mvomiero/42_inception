to ssh

hostname -I, pick the first

connect from the host with 
ssh user@ip -p 4242

to copy a folder with ssh
scp -r -P 4242 my_folder osboxes@10.15.247.178:/home/osboxes/

!! commented out !!

wordpress.sql

!!!! mariadb export .sql

docker exec -it <mariadb_container_name> /bin/bash
// launch bash in maria db
apt-get update
apt-get install -y mysql-client
mysql -u root -p
GRANT ALL PRIVILEGES ON mariadb.* TO 'mvomiero'@'%';
FLUSH PRIVILEGES;
EXIT;
mysqldump -u mvomiero -p wordpress > backup.sql
exit
docker cp mariadb:backup.sql ./


docker cp <mariadb_container_name>:/path/to/backup.sql /path/on/your/host/backup.sql


