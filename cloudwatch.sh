#!/bin/bash

# Check Jenkins status
if systemctl is-active --quiet jenkins; then
    MetricValue=1
else
    MetricValue=0
fi

# Push metric to CloudWatch
/usr/bin/aws cloudwatch put-metric-data \
    --namespace "Custom/Jenkins" \
    --metric-name "JenkinsStatus" \
    --value $MetricValue \
    --unit Count \
    --dimensions service="jenkins"