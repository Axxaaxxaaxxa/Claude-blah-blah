#!/usr/bin/with-contenv bashio

exec xmrig \
  -o "$(bashio::config 'pool')" \
  -u "$(bashio::config 'wallet')" \
  -p "$(bashio::config 'worker')" \
  --threads="$(bashio::config 'threads')" \
  --randomx-mode=light \
  --no-color
