#!/bin/bash

#set -o xtrace

WSREP_IN_ADDR=$(sudo mysql  -e "show status" |grep wsrep_incoming_address)
CONTROLLER_NODE_NUM=`expr $(sudo cat /etc/astute.yaml|grep "  role: controller"|wc -l) + $(sudo cat /etc/astute.yaml|grep "  role: primary-controller"|wc -l)`

if [[ `echo ${WSREP_IN_ADDR}|awk -F, '{print NF} '` == $CONTROLLER_NODE_NUM ]]
then
   INCOMING=1 
else
   INCOMING=0 
fi

WSREP_LOC_STAT_COM=$(sudo mysql  -e "show status"|grep wsrep_local_state_comment)

if [[ `echo ${WSREP_LOC_STAT_COM}|awk '{print $2}'` -eq "Synced" ]]
then
    SYNCED=1
else
    SYNCED=0
fi

WSREP_READY=$(sudo mysql  -e "show status"|grep "wsrep_ready")

if [[ `echo ${WSREP_READY}|awk '{print $2}'` -eq "ON" ]]
then
    READY=1
else
    READY=0
fi

if [[ $INCOMING -eq 1 && $SYNCED -eq 1 && $READY -eq 1 ]]
then
    echo 1
else 
    echo 0
fi
