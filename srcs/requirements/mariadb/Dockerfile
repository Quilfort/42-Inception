FROM	debian:buster

EXPOSE 3306

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY tools/configure.sh /usr/bin/
RUN chmod +x /usr/bin/configure.sh

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld

RUN sed -i "s/bind-address.*/bind-address = mariadb/" /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["configure.sh"]
CMD ["mysqld"]