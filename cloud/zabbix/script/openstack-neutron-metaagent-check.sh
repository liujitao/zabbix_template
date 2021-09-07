#!/bin/bash
#set -o xtrace
# by caton wang

NODE_NAME=$1
NEUTRON_META_AGENT_STATUS=`sudo crm resource status clone_p_neutron-metadata-agent|grep $NODE_NAME|awk '$4~/^running$/ {print 1}'`

if [[ $NEUTRON_META_AGENT_STATUS -eq 1 ]]
then
    echo 1
else
    echo 0
fi

