#!/bin/sh
set -e

# Make sure squid owns the cache and log directory
sudo /bin/chown -R squid:squid  /var/log/squid
sudo /bin/chown -R squid:squid  /var/cache/squid

if [[ -z ${1} ]]; then
  if [[ ! -d /var/cache/squid/00 ]]; then
    echo "Initializing cache..."
    $(which squid) -N -z
  fi
  echo "Starting squid..."
  exec $(which squid) -NYC
else
  exec "$@"
fi
