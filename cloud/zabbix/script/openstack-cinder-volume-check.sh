#!/bin/bash

#set -o xtrace

CINDERVOL_RUNNING_STATUS=`systemctl | grep openstack-cinder-volume |awk '{print $4}'`

if [[ $CINDERVOL_RUNNING_STATUS == "running"  ]]
then
    echo 1    
else
    echo 0
fi
