#!/bin/bash
#set -o xtrace

OVS_SERVICE_STATUS=`systemctl status openvswitch   | grep Active  | awk '$2~/active/ {print 1}'`

OVSDB_SERVER_STATUS=`ps -ef |grep -v grep | grep  ovsdb-server | wc -l`

OVS_VSWITCHED_STATUS=`ps -ef |grep -v grep | grep  ovs-vswitchd | wc -l`


if [[ $OVSDB_SERVER_STATUS -eq 1 && $OVS_VSWITCHED_STATUS -eq 1 && $OVS_SERVICE_STATUS -eq 1  ]]
then
    echo 1
else
    echo 0

fi
