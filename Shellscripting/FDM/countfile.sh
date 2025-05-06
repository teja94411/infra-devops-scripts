#!/bin/bash

# Check if a directory is provided as an argument, otherwise use the current directory
DIR_PATH="${1:-.}"

# Count files and directories
FILE_COUNT=$(find "$DIR_PATH" -type f | wc -l)
DIR_COUNT=$(find "$DIR_PATH" -type d | wc -l)

# Output the results
echo "Number of files: $FILE_COUNT"
echo "Number of directories: $DIR_COUNT"
