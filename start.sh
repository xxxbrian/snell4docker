#!/bin/bash
set -e

if [ -f /snell/snell-server.conf ]; then
    echo "snell-server config file found, starting snell-server..."
    exec /etc/snell-server/snell-server -c /snell/snell-server.conf
fi

echo "snell-server config file not found, generating..."

SNELL_PORT=${SNELL_PORT:-54454}
SNELL_PSK=${SNELL_PSK:-xxxbrianSnellServer}
SNELL_IPV6=${SNELL_IPV6:-false}

cat <<EOF > /snell/snell-server.conf
[snell-server]
listen = 0.0.0.0:$SNELL_PORT
psk = $SNELL_PSK
ipv6 = $SNELL_IPV6
EOF

echo "generated, starting snell-server..."
exec /etc/snell-server/snell-server -c /snell/snell-server.conf