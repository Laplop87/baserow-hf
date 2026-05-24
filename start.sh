#!/bin/bash
echo "=== Listing shell scripts in /baserow and root ==="
find /baserow / -maxdepth 3 -name "*.sh" -type f 2>/dev/null
echo "=== End ==="
exit 1
