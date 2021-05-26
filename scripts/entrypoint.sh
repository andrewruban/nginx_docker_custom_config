#!/bin/bash
set -eo pipefail

export NAMESERVER=$(awk '/^nameserver/{print $2}' /etc/resolv.conf | tr '\n' ' ')\

echo "Nameserver is: $NAMESERVER" 

echo 'Copying nginx config'
envsubst '\$NAMESERVER' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

echo 'Using nginx config:'
cat /etc/nginx/conf.d/default.conf

echo 'Starting nginx'
nginx -g 'daemon off;'

exec "$@"