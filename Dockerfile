FROM nginx:1.19.6-alpine

EXPOSE 443

# Install dependencies
RUN apk update && apk add openjdk11

WORKDIR /root

# Copy source
COPY ./src /root
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf.template

CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'


# Set permissions
RUN chmod a+x clientportal.gw/bin/run.sh \
    ./run.sh

CMD /root/run.sh

