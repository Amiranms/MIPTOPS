#!/bin/sh
set -e

envsubst < /app/listmonk/config.tmpl > /app/listmonk/config.toml

while ! nc -z postgres $DB_PORT; do
  sleep 2
done

if [ -n "$PERMISSIONS_JSON" ]; then
    echo "$PERMISSIONS_JSON" > /app/listmonk/permissions.json
fi


cd /app/listmonk 

echo "y" | /app/listmonk/listmonk --upgrade

exec /app/listmonk/listmonk
