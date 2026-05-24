#!/bin/bash
# Find any nginx config file that says "listen 80" and change it to listen 7860
find /etc/nginx -type f -exec sed -i "s/listen 80;/listen 7860;/g" {} \;
find /etc/nginx -type f -exec sed -i "s/listen [^ ]*:80;/listen 7860;/g" {} \;

# Now start the original Baserow entrypoint
exec /original-entrypoint.sh "$@"
