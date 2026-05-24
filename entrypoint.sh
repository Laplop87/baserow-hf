#!/bin/bash
# Make nginx listen on the port Hugging Face expects
sed -i "s/listen 80;/listen ${PORT:-7860};/g" /etc/nginx/conf.d/*.conf /etc/nginx/nginx.conf 2>/dev/null
exec /baserow.sh "$@"
