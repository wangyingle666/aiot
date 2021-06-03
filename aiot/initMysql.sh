#!/bin/bash
## written by wangyl
## written on 2020-08-10

function initMysql(){
	# addUser
	useradd -M -s /sbin/nologin mysql
	# createLogDir
	mkdir -p /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/logs
	touch /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/logs/mysqld.log
	# chownMysqlfile
	chown -R mysql:mysql /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/
	chmod -R 755 /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/
	# initMysql
	if [ ! -f /INIT/mysqlInit ];then
		mkdir /INIT
		touch /INIT/mysqlInit
		cd /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/bin
        	./mysqld --initialize-insecure --user=mysql --basedir=/usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64 --datadir=/usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/data
	else
		pass
	fi
}

initMysql
