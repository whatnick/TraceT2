#!/bin/sh
set -e

# Ensure persistent data directory structure exists
mkdir -p /tracet/data/logs

# Symlink the database to the persistent volume
if [ ! -L /tracet/db.sqlite3 ] && [ ! -f /tracet/data/db.sqlite3 ]; then
    # First run - move any existing db to data dir
    [ -f /tracet/db.sqlite3 ] && mv /tracet/db.sqlite3 /tracet/data/db.sqlite3 || true
fi
ln -sf /tracet/data/db.sqlite3 /tracet/db.sqlite3

# Symlink logs to persistent volume
rm -rf /tracet/logs
ln -sf /tracet/data/logs /tracet/logs

exec "$@"
