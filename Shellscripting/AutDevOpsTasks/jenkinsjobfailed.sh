#!/bin/bash

# Jenkins URL and Job Name
JENKINS_URL="http://your-jenkins-server"
JOB_NAME="your-jenkins-job"
USER="your_username"
API_TOKEN="your_api_token"

# Check Jenkins job status
STATUS=$(curl -s "$JENKINS_URL/job/$JOB_NAME/lastBuild/api/json" \
            --user $USER:$API_TOKEN | jq -r '.result')

# If the job failed, send an alert
if [ "$STATUS" == "FAILURE" ]; then
    echo "Jenkins job $JOB_NAME failed." | mail -s "Jenkins Job Failure" your-email@example.com
fi
