#!/bin/bash

# Set the threshold for uptime in seconds (30 days)
threshold=2592000  # 30 days = 30 * 24 * 60 * 60 seconds

# Get system uptime in seconds
uptime_seconds=$(cat /proc/uptime | awk '{print $1}')

# Compare uptime with threshold
if (( $(echo "$uptime_seconds > $threshold" | bc -l) )); then
    echo "System has been up for more than 30 days. Please consider rebooting." | mail -s "Reboot Reminder" your-email@example.com
else
    echo "System uptime is within acceptable limits."
fi


Explanation:
# cat /proc/uptime gives the system uptime in seconds.
# The script compares the uptime to the threshold (30 days = 2592000 seconds).
# If the uptime exceeds 30 days, it sends an email reminder to reboot.