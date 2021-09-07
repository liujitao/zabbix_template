#!/bin/bash

CEPH_HEALTH_STATUS=$(ceph -s|grep health |awk '{print $2}')
if [[ "${CEPH_HEALTH_STATUS}" = "HEALTH_OK" ]]
then
    echo 1
else
    echo 0
fi
