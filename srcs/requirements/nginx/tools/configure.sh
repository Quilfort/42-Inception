#!/bin/bash

sed -i "s/SERVER_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-enabled/nginx.conf

if [ ! -f "/etc/ssl/certs/certificate.crt" ]; then
    echo "Configure new OPENSSL certificate"
    openssl req -new \
            -newkey rsa:2048 \
            -x509 \
            -sha256 \
            -days 356 \
            -keyout /etc/ssl/private/certificate.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt \
            -subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_LOCALITY/O=$SSL_ORGANISATION/CN=$DOMAIN_NAME"
else
    echo "OPENSSL certificate already created"
fi

exec "$@"