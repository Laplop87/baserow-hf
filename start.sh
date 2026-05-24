#!/bin/bash
set -e

echo "Checking for Baserow admin creation..."
if [ -n "${BASEROW_ADMIN_USER}" ] && [ -n "${BASEROW_ADMIN_PASSWORD}" ] && [ -n "${BASEROW_ADMIN_EMAIL}" ]; then
    echo "Creating admin user ${BASEROW_ADMIN_USER} ..."
    python /baserow/backend/src/baserow/manage.py create_admin \
        --username="${BASEROW_ADMIN_USER}" \
        --password="${BASEROW_ADMIN_PASSWORD}" \
        --email="${BASEROW_ADMIN_EMAIL}" || echo "Admin may already exist, continuing."
else
    echo "Admin env vars not set – skipping automatic creation."
fi

# Launch the original Baserow startup
exec /baserow/docker/docker-entrypoint.sh start
