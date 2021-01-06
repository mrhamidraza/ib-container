FROM nginx:1.19.6-alpine

ENV PORT=80

# Install dependencies
RUN apk update && apk add openjdk11

WORKDIR /

# Copy source
COPY --chown=nginx:nginx ./src /

# Copy nginx config
COPY ./nginx /etc/nginx/

# Set permissions
RUN chmod a+x clientportal.gw/bin/run.sh \
    /docker-entrypoint.d/30-clientportal.sh

# Set ownership
RUN chown -R nginx:nginx /etc/nginx/conf.d/

USER nginx

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]