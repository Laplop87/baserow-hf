#!/bin/bash
echo "=== Looking for Baserow entrypoint ==="
ls -la /baserow/docker/ 2>/dev/null || echo "/baserow/docker/ not found"
ls -la /baserow/ | grep docker
find /baserow -maxdepth 3 -name "docker-entrypoint*" 2>/dev/null
echo "=== End diagnostic ==="
exit 1
