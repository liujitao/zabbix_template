#!/bin/bash

#set -o xtrace

NOVAAPI_RUNNING_STATUS=`systemctl | grep openstack-nova-consoleauth |awk '{print $4}'`

if [[ $NOVAAPI_RUNNING_STATUS == "running"  ]]
then
    echo 1    
else
    echo 0
fi
