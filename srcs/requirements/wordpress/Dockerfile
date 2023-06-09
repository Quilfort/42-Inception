FROM	debian:buster

EXPOSE 9000

RUN apt-get update && apt-get upgrade -y

RUN apt install php-fpm php-mysql -y
RUN apt install curl mariadb-client -y

COPY tools/configure.sh /var/www/
RUN chmod +x /var/www/configure.sh

ENTRYPOINT ["/var/www/configure.sh"]