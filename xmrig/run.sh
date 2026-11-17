#!/usr/bin/with-contenv bashio

POOL=$(bashio::config 'pool')
WALLET=$(bashio::config 'wallet')
WORKER=$(bashio::config 'worker')

cat > /tmp/config.json << JSONEOF
{
    "autosave": false,
    "background": false,
    "colors": false,
    "randomx": {
        "mode": "light",
        "1gb-pages": false,
        "numa": false
    },
    "cpu": {
        "enabled": true,
        "max-threads-hint": 100
    },
    "pools": [
        {
            "url": "${POOL}",
            "user": "${WALLET}",
            "pass": "${WORKER}",
            "keepalive": true,
            "tls": false
        }
    ]
}
JSONEOF

exec xmrig --config=/tmp/config.json
