#!/bin/bash
NODES=$(/usr/bin/sudo /usr/sbin/crm_resource --locate --quiet --resource $1)
if [ "$NODES" = "" ];then
 echo 0
else
 echo 1
fi
