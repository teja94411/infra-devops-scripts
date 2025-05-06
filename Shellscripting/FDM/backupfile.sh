#!/bin/bash

# Define the source directory 
source_dir="/path/to/source"

# Define the backup directory 
backup_dir="/path/to/backup"

# Ensure the backup directory exists, if it doesn't, create it
mkdir -p "$backup_dir"

# Create a timestamp for the backup for unique file names
timestamp=$(date "+%Y%m%d_%H%M%S")

# Use tar to create a compressed backup (tar.gz) with the timestamp in the filename
tar -czf "$backup_dir/backup_$timestamp.tar.gz" "$source_dir"

# Perform the backup using rsync to copy only changed files
rsync -av --delete "$source_dir/" "$backup_dir/backup_$timestamp/"

# Print a message indicating that the backup is complete
echo "Backup of $source_dir completed and saved to $backup_dir/backup_$timestamp.tar.gz"


