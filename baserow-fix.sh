#!/bin/bash
# Find any nginx.conf files and change port 80 to 7860
find / -name "nginx.conf" -exec sed -i "s/listen 80;/listen 7860;/g" {} \;

# Start Baserow's normal supervisor process
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
