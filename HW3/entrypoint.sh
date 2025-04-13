#!/bin/sh
set -e

: "${APP_ADDRESS:=0.0.0.0}"
: "${APP_PORT:=8848}"

cat << EOF > /app/helloworld/config.json
{
  "listeners": [{
      "address": "${APP_ADDRESS}",
      "port": ${APP_PORT}
  }]
}
EOF

echo "Generated config.json:"

exec /app/helloworld/helloworld