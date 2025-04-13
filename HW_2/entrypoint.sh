#!/bin/sh
set -e

envsubst < /app/listmonk/config.tmpl > /app/listmonk/config.toml

while ! nc -z postgres 5432; do
  sleep 2
done

cd /app/listmonk 

echo "y" | /app/listmonk/listmonk --install

exec /app/listmonk/listmonk
