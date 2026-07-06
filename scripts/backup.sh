#!/bin/bash

set -e

BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/hoteldb_${TIMESTAMP}.sql"

mkdir -p "${BACKUP_DIR}"

docker exec hotel-postgres pg_dump \
  -U postgres \
  -d hoteldb > "${BACKUP_FILE}"

echo "Backup completed successfully."
echo "Backup file: ${BACKUP_FILE}"
