#!/bin/sh

#copy ssl or no ssl file based on env parameter passed

if [ "$SSL_ENABLED" == "true" ]; then
  cp nginx-ssl.conf /etc/nginx/nginx.conf
  echo "ssl-conf copied"
else
  cp nginx.conf /etc/nginx/nginx.conf
  echo "non ssl conf copied"
fi

nginx -g 'daemon off;' &
node index.js
