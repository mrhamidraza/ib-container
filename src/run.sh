# Run client portal in background
cd clientportal.gw && sh bin/run.sh root/conf.yaml &

echo "Starting nginx on port " $PORT

# Run nginx
nginx -g 'daemon off;'
