#!/bin/bash
#set -o xtrace


#OVSDB_SERVER_STATUS=`/etc/init.d/openvswitch status|grep ovsdb-server|awk '{print $3}'`

#OVS_VSWITCHED_STATUS=`/etc/init.d/openvswitch status|grep ovs-vswitchd|awk '{print $3}'`
OVS_STATUS=`systemctl is-active  openvswitch`

#if [[ $OVSDB_SERVER_STATUS == "running" && $OVS_VSWITCHED_STATUS == "running"   ]]
if [[  $OVS_STATUS == "active"   ]]
then

    echo 1
else
    echo 0

fi
