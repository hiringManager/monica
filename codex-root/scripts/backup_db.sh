#!/bin/bash
BACKUP_DIR=./db_backups
mkdir -p "$BACKUP_DIR"
DATE=$(date +%Y%m%d_%H%M%S)
docker compose exec db mysqldump -umonica -pmonicapass monica > "$BACKUP_DIR/monica_db_${DATE}.sql"
echo "DB backup completed: $BACKUP_DIR/monica_db_${DATE}.sql"
