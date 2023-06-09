FROM	debian:buster

RUN		apt update
RUN     apt install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf


COPY	conf/nginx.conf /etc/nginx/conf.d/default.conf