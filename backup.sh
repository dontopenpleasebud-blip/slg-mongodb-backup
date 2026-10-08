#!/bin/bash

set -e

REPO="/root/mongodb-git-backup"
DATE=$(date '+%Y-%m-%d-%H%M')
BACKUP_DIR="$REPO/backups/$DATE"

mkdir -p "$BACKUP_DIR"

echo "Starting MongoDB backup: $DATE"

mongodump --db parlour-db --archive="$BACKUP_DIR/parlour-db.archive.gz" --gzip

cd "$REPO"

git add .
git commit -m "MongoDB Backup $DATE"
git push origin main

echo "Backup completed: $DATE"
