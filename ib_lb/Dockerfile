FROM nginx:1.19.6-alpine

ARG APP_DOMAIN=localhost

# Create self-signed certs
RUN apk add openssl

RUN mkdir /etc/ssl/localcerts && cd /etc/ssl/localcerts && \
    openssl genrsa -des3 -passout pass:LcAYd9Ecu6mMLe3D -out server.pass.key 2048 && \
    openssl rsa -passin pass:LcAYd9Ecu6mMLe3D -in server.pass.key -out server.key && \
    rm server.pass.key && \
    openssl req -new -key server.key -out server.csr -subj "/C=UK/ST=Warwickshire/L=Leamington/O=OrgName/OU=IT Department/CN=$APP_DOMAIN" && \
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

COPY default.conf.template /etc/nginx/templates/