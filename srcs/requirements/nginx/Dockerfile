FROM	debian:buster

EXPOSE 443

RUN	    apt-get update && apt-get upgrade -y
RUN     apt install -y nginx openssl

COPY	conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN     rm -rf /etc/nginx/sites-enabled/*
RUN     ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

COPY    tools/configure.sh /usr/bin/
RUN     chmod +x /usr/bin/configure.sh

ENTRYPOINT ["configure.sh"]
CMD ["nginx", "-g", "daemon off;"]