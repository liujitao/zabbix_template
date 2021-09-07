#!/bin/bash

#set -o xtrace

GLANCEAPI_RUNNING_STATUS=`systemctl | grep openstack-glance-api |awk '{print $4}'`

if [[ $GLANCEAPI_RUNNING_STATUS == "running"  ]]
then
    echo 1    
else
    echo 0
fi
