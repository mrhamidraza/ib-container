FROM nginx:1.19.6-alpine

# Install dependencies
RUN apk update && apk add openjdk11

WORKDIR /root

PORT=8080
EXPOSE $PORT

# Copy source
COPY ./src /root

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'

# Set permissions
RUN chmod a+x clientportal.gw/bin/run.sh \
    ./run.sh

CMD /root/run.sh

