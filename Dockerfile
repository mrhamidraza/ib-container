FROM nginx:1.19.6-alpine

ENV PORT=80

# Install dependencies
RUN apk update && apk add openjdk11

WORKDIR /root

# Copy source
COPY ./src /root

# Copy nginx template
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template

# Set permissions
RUN chmod a+x clientportal.gw/bin/run.sh \
    ./run.sh

CMD /root/run.sh

