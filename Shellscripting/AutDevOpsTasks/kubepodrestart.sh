#!/bin/bash

# Jenkins URL, Job Name, and Credentials
JENKINS_URL="http://your-jenkins-server"
JOB_NAME="your-jenkins-job"
USER="your_username"
API_TOKEN="your_api_token"

# Check Jenkins job status
STATUS=$(curl -s "$JENKINS_URL/job/$JOB_NAME/lastBuild/api/json" \
            --user $USER:$API_TOKEN | jq -r '.result')

# If the job failed, restart the job
if [ "$STATUS" == "FAILURE" ]; then
    echo "Jenkins job $JOB_NAME failed. Restarting job..." | mail -s "Jenkins Job Restart" your-email@example.com
    curl -X POST "$JENKINS_URL/job/$JOB_NAME/build" --user $USER:$API_TOKEN
fi
