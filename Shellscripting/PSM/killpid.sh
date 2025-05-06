#!/bin/bash

# Set the CPU threshold
threshold=90

# Get the list of processes consuming more than 90% of the CPU
processes=$(ps aux --sort=-%cpu | awk -v threshold="$threshold" '$3 > threshold {print $2, $3, $11}')

# Check if any processes are consuming more than 90% CPU
if [ -n "$processes" ]; then
    echo "Processes consuming more than $threshold% CPU:"
    echo "$processes"

    # Extract process IDs (PID) and kill them
    echo "$processes" | awk '{print $1}' | while read pid; do
        echo "Killing process with PID: $pid"
        kill -9 $pid
    done
else
    echo "No processes consuming more than $threshold% CPU."
fi

Explanation:
# Threshold: We set the threshold to 90 (meaning we will check for processes consuming more than 90% CPU).
# ps aux --sort=-%cpu: This command lists all processes sorted by CPU usage in descending order.
# awk -v threshold="$threshold" '$3 > threshold {print $2, $3, $11}':
# $3 refers to the CPU usage of each process.
# $2 is the PID (Process ID).
# $11 is the command that started the process.
# We print the PID, CPU usage, and command of processes consuming more than the threshold CPU.
# Check and Kill: If any processes exceed the threshold, the script extracts the process IDs (PIDs) and uses the kill -9 command to terminate them forcefully.
# If no processes exceed 90% CPU: It prints a message saying there are no such processes.
