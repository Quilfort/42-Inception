FROM	debian:buster

RUN	apt update
RUN     apt install -y nginx openssl

RUN	mkdir -p /etc/nginx/ssl
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/ssl_certificat.pem -keyout /etc/nginx/ssl/ssl_key.key \
        -subj "/C=NL/ST=NORTH-HOLLAND/L=AMSTERDAM/O=CODAM/OU=qfrederi/CN=qfrederi/"

COPY	conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT	["nginx", "-g", "daemon off;"]