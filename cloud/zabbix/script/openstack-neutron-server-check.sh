#!/bin/bash

#set -o xtrace

NEUTRON_RUNNING_STATUS=`systemctl | grep neutron-server |awk '{print $4}'`

if [[ $NEUTRON_RUNNING_STATUS == "running"  ]]
then
    echo 1    
else
    echo 0
fi
