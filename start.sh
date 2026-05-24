#!/bin/bash
echo "=== Debugging entrypoint with start ==="
bash -x /baserow/backend/docker/docker-entrypoint.sh start 2>&1 || true
echo "=== End debug ==="
exit 1
