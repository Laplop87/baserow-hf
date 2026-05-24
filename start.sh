#!/bin/bash
echo "=== Looking for root-level entrypoint ==="
ls -la /docker-entrypoint.sh 2>/dev/null || echo "/docker-entrypoint.sh not found"
ls -la /entrypoint.sh 2>/dev/null || echo "/entrypoint.sh not found"
echo "=== Searching entire container for entrypoint ==="
find / -maxdepth 2 -name "*entrypoint*" -type f 2>/dev/null | head -20
echo "=== End ==="
exit 1
