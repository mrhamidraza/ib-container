FROM nginx:1.19.6-alpine

# Install dependencies
RUN apk update && apk add openjdk11

WORKDIR /root

ENV PORT=$PORT

# Copy source
COPY ./src /root

RUN echo "<<<<<<<<<<<<<<<<<===== Starting nginx on port: $PORT ..."

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'

# Set permissions
RUN chmod a+x clientportal.gw/bin/run.sh \
    ./run.sh

CMD /root/run.sh

