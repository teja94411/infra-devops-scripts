#!/bin/bash

# Define directories to exclude from the search (critical system directories, virtual filesystems, and config files)
EXCLUDE_DIRS=(
    "/proc"
    "/sys"
    "/dev"
    "/run"
    "/mnt"
    "/media"
    "/boot"
    "/root"
    "/home/*/.cache"
    "/home/*/.config"       # Exclude user configuration files
    "/lib"
    "/lib64"
    "/etc"                  # Exclude system configuration files
    "/var/lib"              # Exclude important system and app data files
)

# Define the directory to clean
LOG_DIR="/var/log"

# Construct the exclusion part of the find command
EXCLUDE_CMD=""
for dir in "${EXCLUDE_DIRS[@]}"; do
    EXCLUDE_CMD="$EXCLUDE_CMD -path $dir -prune -o"
done

# Find and delete files older than 30 days in $LOG_DIR, excluding the specified directories
find $LOG_DIR $EXCLUDE_CMD -type f -mtime +30 -exec rm -f {} \;

# Print a message indicating the operation is complete
echo "Deleted files older than 30 days from $LOG_DIR"
