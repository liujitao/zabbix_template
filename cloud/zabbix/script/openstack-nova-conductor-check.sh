#!/bin/bash

#set -o xtrace

NOVA_CONDUCTOR_STATUS=`systemctl | grep openstack-nova-conductor |awk '{print $4}'`

if [[ $NOVA_CONDUCTOR_STATUS == "running"  ]]
then
    echo 1    
else
    echo 0
fi
