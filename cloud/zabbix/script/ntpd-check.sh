#!/bin/bash

#set -o xtrace

NTPD_RUNNING_STATUS=`systemctl status ntpd|grep Active |awk '{print $2}'`

if [[ $NTPD_RUNNING_STATUS == "active"  ]]
then
    echo 1    
else
    echo 0
fi
