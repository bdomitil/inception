#! /bin/bash
echo "[mysqld]" >> /etc/mysql/mariadb.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.cnf
echo "[client]" >> /etc/mysql/mariadb.cnf
echo "user=root" >> /etc/mysql/mariadb.cnf
echo "password=$ROOT_PASSWD" >> /etc/mysql/mariadb.cnf
service mysql start
sleep 5
echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} " | mariadb
echo "CREATE USER 'wordpress'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mariadb
echo "GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%';" | mariadb
echo "UPDATE mysql.user set plugin='mysql_native_password' WHERE user = 'root' ;" | mariadb
echo "UPDATE mysql.user set plugin='mysql_native_password' WHERE user = '${DB_USER}' ;" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb
echo "ALTER USER '${DB_USER}' IDENTIFIED BY '${DB_PASSWORD}';" | mariadb
service mysql stop
mysqld