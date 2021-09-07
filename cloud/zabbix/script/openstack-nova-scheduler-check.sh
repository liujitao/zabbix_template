#!/bin/bash

#set -o xtrace 
CINDERAPI_RUNNING_STATUS=`systemctl | grep openstack-nova-scheduler |awk '{print $4}'`

if [[ $CINDERAPI_RUNNING_STATUS == "running"  ]]
then
    echo 1    
else
    echo 0
fi
