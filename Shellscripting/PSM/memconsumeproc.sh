#!/bin/bash

# Set the log file path
log_file="/var/log/top_memory_processes.log"

# Function to log the top 10 memory-consuming processes
log_memory_usage() {
    echo "Logging memory usage at $(date)" >> $log_file
    ps aux --sort=-%mem | head -n 11 >> $log_file
    echo "---------------------------------" >> $log_file
}

# Log memory usage every 8 hours
while true; do
    log_memory_usage
    sleep 28800  # Sleep for 8 hours (28800 seconds)
done

Explanation:
# Log File: The script logs the memory usage data to the file /var/log/top_memory_processes.log. You can change this path if you'd like to store the logs elsewhere.
# Function to Log Memory Usage:
# ps aux --sort=-%mem lists the processes sorted by memory usage in descending order.
# head -n 11 grabs the top 10 processes, including the header (so 11 lines total).
# Sleep Interval:
# sleep 28800 pauses the script for 8 hours (28800 seconds) before it logs the data again.
# Loop: The script runs continuously, logging memory usage every 8 hours.