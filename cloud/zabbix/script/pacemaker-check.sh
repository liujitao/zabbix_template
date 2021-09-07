#!/bin/bash

#set -o xtrace 

PACEMAKER_STATUS=$(crm status|grep Online|cut -c 9-)
if [[ $(echo ${PACEMAKER_STATUS}|awk -F[ '{print $2}'|awk -F] '{print $1}'|awk '{print NF}') -eq 3 ]]
then
    echo 1 
else
    echo 0
fi
