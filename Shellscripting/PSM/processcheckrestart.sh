#!/bin/bash

# Write a script that checks if a process (e.g., nginx) is running, and restarts it if not.
PROCESS=$(ps aux | grep '[n]ginx' | wc -l)

# If nginx is not running, restart it
if [ $PROCESS -eq 0 ]; then
    echo "Nginx is not running. Restarting it now..."
    systemctl restart nginx
    echo "Nginx has been restarted." | mail -s "Nginx Restart Alert" your-email@example.com
else
    echo "Nginx is running."
fi

Explanation:

# ps aux | grep '[n]ginx' checks if nginx is running. The grep '[n]ginx' pattern ensures we don’t count the grep process itself.
# If nginx is not running (PROCESS -eq 0), it restarts nginx and sends an alert email.