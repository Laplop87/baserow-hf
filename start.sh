#!/bin/bash
set -e

# Function to create the admin user in the background, after the backend is up
create_admin_when_ready() {
    echo "Waiting for Baserow backend to become available..."
    until python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/api/_health/')" 2>/dev/null; do
        sleep 2
    done
    echo "Backend is up. Checking for admin creation..."
    if [ -n "${BASEROW_ADMIN_USER}" ] && [ -n "${BASEROW_ADMIN_PASSWORD}" ] && [ -n "${BASEROW_ADMIN_EMAIL}" ]; then
        echo "Creating admin user ${BASEROW_ADMIN_USER} ..."
        /baserow/backend/docker/docker-entrypoint.sh manage create_admin \
            --username="${BASEROW_ADMIN_USER}" \
            --password="${BASEROW_ADMIN_PASSWORD}" \
            --email="${BASEROW_ADMIN_EMAIL}" || echo "Admin may already exist, continuing."
    else
        echo "Admin env vars not set – skipping."
    fi
}

# Launch the admin creation in the background
create_admin_when_ready &

# Start Baserow services (this keeps the container alive)
echo "Starting Baserow services..."
exec /baserow.sh start
