#!/bin/bash

# Set the threshold for CPU usage
threshold=90

# Get the CPU usage percentage (excluding idle time)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

# Check if the CPU usage exceeds the threshold
if [ "$cpu_usage" -gt "$threshold" ]; then
    # If CPU usage exceeds threshold, output the message
    echo "High CPU usage detected: $cpu_usage%"
    echo "High CPU usage detected: $cpu_usage%" | mail -s "CPU Usage Alert" your-email@example.com
fi

Explanation:
# threshold=90: Sets the threshold for CPU usage (in this case, 90%).
# cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1):
# top -bn1: Fetches a single snapshot of the CPU usage.
# grep "Cpu(s)": Filters the line containing CPU information.
# awk '{print $2}': Extracts the percentage of CPU usage.
# cut -d. -f1: Removes the decimal portion, as you only want the integer part.
# if [ "$cpu_usage" -gt "$threshold" ]: Compares the CPU usage with the threshold.
# If the usage exceeds the threshold, it triggers the alert.