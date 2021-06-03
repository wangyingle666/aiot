FROM centos:7.6.1810
MAINTAINER wangyl yingle.wang@sharetome.com

COPY my.cnf install.sh supervisord-mysql.ini initMysql.sh /etc/

RUN /etc/install.sh

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
