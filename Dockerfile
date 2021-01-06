FROM nginx:1.19.6-alpine

ENV PORT=80

# Install dependencies
RUN apk update && apk add openjdk11

WORKDIR /

# Copy source
COPY --chown=nginx:nginx ./src /

# Copy nginx template
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Set permissions
RUN chmod a+x clientportal.gw/bin/run.sh \
    ./run.sh

USER nginx

CMD /run.sh

