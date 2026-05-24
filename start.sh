#!/bin/bash
echo "=== Searching for original Baserow entrypoint ==="
if [ -f /baserow/docker/docker-entrypoint.sh ]; then
    echo "Found: /baserow/docker/docker-entrypoint.sh"
elif [ -f /baserow/docker-entrypoint.sh ]; then
    echo "Found: /baserow/docker-entrypoint.sh"
else
    echo "Not in usual places, searching everywhere..."
    find / -name "docker-entrypoint.sh" -type f 2>/dev/null
fi
echo "=== End ==="
exit 1
