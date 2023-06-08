FROM	debian:buster

EXPOSE 3306

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY config/configure.sh /usr/bin/
RUN chmod +x /usr/bin/configure.sh

RUN mkdir -p /var/run/mysql
RUN chown -R mysql:root /var/run/mysql

ENTRYPOINT ["configure.sh"]
CMD ["mysqld"]