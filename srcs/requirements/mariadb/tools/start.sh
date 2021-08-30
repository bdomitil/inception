#! /bin/bash
echo "[mysqld]" >> /etc/mysql/mariadb.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.cnf
cat /etc/mysql/mariadb.cnf
service mysql start
echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mariadb
echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mariadb
echo "GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%';" | mariadb
echo "update mysql.user set plugin='mysql_native_password' where user='${DB_USER}';" | mariadb;
echo "FLUSH PRIVILEGES;" | mariadb
service mysql stop
mysqld