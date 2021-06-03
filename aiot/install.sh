#!/bin/bash
## written by wangyl
## written on 2020-08-10

function installMysql(){
	# addUser
	useradd -M -s /sbin/nologin mysql
	# createLogDir
	mkdir -p /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/logs
	touch /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/logs/mysqld.log
	# chownMysqlfile
	chown -R mysql:mysql /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/
	chmod -R 755 /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/
	# installRpm
	yum -y install libaio numactl
	yum clean all
	# initMysql
	cd /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/bin
        ./mysqld --initialize-insecure --user=mysql --basedir=/usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64 --datadir=/usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/data
}

function startMysql(){
	cd /usr/mysql/mysql-5.7.22-linux-glibc2.12-x86_64/support-files
	./mysql.server start
}

function installSupervisord(){
	yum -y install libaio numactl
	yum install -y epel-release
	yum install -y supervisor
	yum clean all
	
	sed -i 's/nodaemon=false/nodaemon=true/g' /etc/supervisord.conf
	mv /etc/supervisord-mysql.ini /etc/supervisord.d/
}

installSupervisord
