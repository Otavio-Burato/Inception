FROM debian:oldstable

RUN apt -y update && apt -y install mariadb-server mariadb-client

RUN mkdir -p /var/lib/mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/mariadb.conf
COPY ./conf/conf.sql /usr/local/bin/

COPY ./tools/mariadb.sh /usr/local/bin/
RUN bash /usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "mysqld_safe" ]
