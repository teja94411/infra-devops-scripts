#!/bin/bash

# Run the system update
echo "Starting system update..."

# Update the system (for Ubuntu/Debian-based systems)
sudo apt update && sudo apt upgrade -y

# Check if update was successful
if [ $? -eq 0 ]; then
    echo "System updates completed successfully." | mail -s "System Update Report" your-email@example.com
else
    echo "System updates failed. Please check the logs." | mail -s "System Update Report" your-email@example.com
fi
