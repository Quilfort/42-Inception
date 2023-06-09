FROM	debian:buster

EXPOSE 3306

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY tools/configure.sh /usr/bin/
RUN chmod +x /usr/bin/configure.sh

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld

ENTRYPOINT ["configure.sh"]
CMD ["mysqld"]