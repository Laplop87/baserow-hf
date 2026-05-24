#!/bin/bash
echo "=== Searching for the main Baserow entrypoint ==="
find /baserow -maxdepth 3 \( -name "*entrypoint*" -o -name "*startup*" -o -name "*init*" \) -type f 2>/dev/null
echo "=== Also checking for start command in known scripts ==="
grep -l "start)" /baserow/*/docker/docker-entrypoint.sh 2>/dev/null || echo "not in docker-entrypoint.sh"
grep -l "start)" /baserow/*/entrypoint.sh 2>/dev/null || echo "no entrypoint.sh found"
grep -l "start)" /baserow/startup.sh 2>/dev/null || echo "no startup.sh found"
echo "=== Looking at the container process 1 ==="
cat /proc/1/cmdline | tr '\0' ' ' 
echo ""
echo "=== End ==="
exit 1
