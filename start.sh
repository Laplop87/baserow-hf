#!/bin/bash
set -e

echo "Checking for Baserow admin creation..."
if [ -n "${BASEROW_ADMIN_USER}" ] && [ -n "${BASEROW_ADMIN_PASSWORD}" ] && [ -n "${BASEROW_ADMIN_EMAIL}" ]; then
    echo "Waiting for database to be ready..."
    /baserow/backend/docker/docker-entrypoint.sh wait_for_db

    echo "Running any pending migrations..."
    /baserow/backend/docker/docker-entrypoint.sh manage migrate --noinput

    echo "Creating admin user ${BASEROW_ADMIN_USER} ..."
    /baserow/backend/docker/docker-entrypoint.sh manage create_admin \
        --username="${BASEROW_ADMIN_USER}" \
        --password="${BASEROW_ADMIN_PASSWORD}" \
        --email="${BASEROW_ADMIN_EMAIL}" || echo "Admin may already exist, continuing."
else
    echo "Admin env vars not set – skipping automatic creation."
fi

echo "Starting Baserow services..."
exec /baserow.sh start
