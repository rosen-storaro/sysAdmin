#!/bin/bash

# Настройки
BACKUP_DIR="/var/backups/website"
DATE=$(date +%F_%H-%M)
DB_USER="wpuser"
DB_PASS="YOUR_STRONG_PASSWORD"
DB_NAME="wpdb"
WEB_DIR="/var/www/wordpress"

# 1. Архив на базата данни (SQL Dump)
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/db_backup_$DATE.sql

# 2. Архив на файловете (tar.gz)
tar -czf $BACKUP_DIR/files_backup_$DATE.tar.gz $WEB_DIR

# 3. Изчистване на стари архиви (пази само последните 7 дни)
find $BACKUP_DIR -type f -mtime +7 -delete

echo "Backup successful: $DATE"
