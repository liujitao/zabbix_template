#!/bin/bash

#set -o xtrace

CINDER_SCH_RUNNING_STATUS=`systemctl | grep openstack-cinder-scheduler |awk '{print $4}'`

if [[ $CINDER_SCH_RUNNING_STATUS == "running"  ]]
then
    echo 1    
else
    echo 0
fi
