#!/bin/sh
set -e

chown -R squid:squid  ${SQUID_LOG_DIR}
chown -R squid:squid  ${SQUID_CACHE_DIR}

if [[ -z ${1} ]]; then
  if [[ ! -d ${SQUID_CACHE_DIR}/00 ]]; then
    echo "Initializing cache..."
    $(which squid) -N -z
  fi
  echo "Starting squid..."
  exec $(which squid) -NYCd 1
else
  exec "$@"
fi
