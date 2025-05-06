#!/bin/bash

# MySQL Database Credentials
USER="your_user"
PASSWORD="your_password"
DATABASE="your_database"
BACKUP_DIR="/path/to/backup"

# Current Date for Backup Filename
DATE=$(date +%F)

# Backup Command
mysqldump -u $USER -p$PASSWORD $DATABASE > $BACKUP_DIR/db_backup_$DATE.sql

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup for $DATABASE completed successfully on $DATE." | mail -s "MySQL Backup Success" your-email@example.com
else
    echo "Database backup failed for $DATABASE on $DATE." | mail -s "MySQL Backup Failure" your-email@example.com
fi

