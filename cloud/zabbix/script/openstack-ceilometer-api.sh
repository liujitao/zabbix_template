#!/bin/bash

#set -o xtrace

CEILOMETER_API_RUNNING_STATUS=`systemctl | grep  openstack-ceilometer-api |awk '{print $4}'`

if [[ "$CEILOMETER_API_RUNNING_STATUS" == "running"  ]]
then
    echo 1    
else
    echo 0
fi
