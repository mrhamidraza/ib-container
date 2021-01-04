# Run client portal in background
cd clientportal.gw && sh bin/run.sh root/conf.yaml &

# Run nginx
nginx -g 'daemon off;'
