#!/bin/bash

#check disk usage
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

#if disk usage will exceeds to 90% , send an alert
if [ $DISK_USAGE -gt 90 ]; then
   echo "Disk usage is above 90%. Current usage is ${DISK_USAGE}%." | mail -s "Disk Usage Alert" your-email@example.com
fi  

Explanation:-
# df / checks the disk usage of the root directory.
# awk '{ print $5 }' grabs the percentage usage.
# sed 's/%//g' removes the percent sign to make it a number.
# If the disk usage is greater than 90%, it sends an email alert (you need mail set up for this).