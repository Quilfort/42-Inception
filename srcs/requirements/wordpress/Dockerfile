FROM	debian:buster

EXPOSE 9000

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php7.3-mysql php7.3-fpm
RUN apt install -y mariadb-client curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/

RUN mkdir -p /run/php
RUN sed -i "s/listen.*/listen = wordpress:9000/" /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/configure.sh /var/www/
RUN chmod +x /var/www/configure.sh

ENTRYPOINT ["/var/www/configure.sh"]
CMD ["php7.3-fpm", "-F"]