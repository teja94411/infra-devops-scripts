#!/bin/bash

# Get system hostname
echo "Hostname: $(hostname)"

# Get OS information
echo "OS Information: $(uname -a)"

# Get Memory Usage
echo "Memory Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"

# Get CPU Usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
echo "CPU Usage: $cpu_usage%"

# Get Disk Usage
disk_usage=$(df -h / | grep / | awk '{ print $5 }')
echo "Disk Usage: $disk_usage"

# Get Uptime
uptime=$(uptime -p)
echo "System Uptime: $uptime"


Explanation:
# Hostname: hostname fetches the system's hostname.
# OS Information: uname -a provides detailed information about the operating system.
# Memory Usage: free -h gives the memory usage in human-readable format, and we extract the used and total memory.
# CPU Usage: top -bn1 gives a snapshot of CPU usage, and we extract the percentage of usage.
# Disk Usage: df -h / checks disk usage for the root directory.
# Uptime: uptime -p gives the system's uptime in a human-readable format.