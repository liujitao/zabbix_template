#!/bin/bash

#set -o xtrace

GLANCEREG_RUNNING_STATUS=`systemctl | grep openstack-glance-registry |awk '{print $4}'`

if [[ $GLANCEREG_RUNNING_STATUS == "running"  ]]
then
    echo 1    
else
    echo 0
fi
