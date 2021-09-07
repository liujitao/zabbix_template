#!/bin/bash

# by Caton Wang

CEPH_MON_NODE=$1

CEPH_MON_STATUS=`ceph mon stat|awk '{print $11}'|grep $CEPH_MON_NODE`


if [[ $CEPH_MON_STATUS ]]
then
    echo 1
else
    echo 0
fi
