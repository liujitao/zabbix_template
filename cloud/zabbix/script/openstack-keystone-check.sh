#!/bin/bash

#set -o xtrace

KEYSTONE_RUNNING_STATUS=`systemctl status openstack-keystone | grep Active |awk '{print $2}'`

if [[ $KEYSTONE_RUNNING_STATUS == "active"  ]]
then
    echo 1    
else
    echo 0
fi
