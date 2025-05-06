#!/bin/bash

# Define the service name (e.g., Apache)
SERVICE="apache2"  # Change to "httpd" if you're using CentOS/RHEL-based systems

# Check if the service is running
if ! systemctl is-active --quiet $SERVICE; then
    # If the service is not running, restart it
    echo "$SERVICE is not running. Restarting..."
    systemctl restart $SERVICE

    # Check if the service has restarted successfully
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE has been successfully restarted."
    else
        echo "Failed to restart $SERVICE."
    fi
else
    echo "$SERVICE is running."
fi
