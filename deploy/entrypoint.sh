#!/bin/sh
set -e

# Ensure persistent data directory structure exists
mkdir -p "${LOG_DIR:-/tracet/data/logs}"

exec "$@"
