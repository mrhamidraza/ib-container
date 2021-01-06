#!/bin/sh

set -e

echo "Running clientportal"
cd /clientportal.gw && sh bin/run.sh root/conf.yaml &