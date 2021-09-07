#!/bin/bash

CEPH_OSD_MAP_STATUS=$(ceph -s|egrep "(down|out)")

if [[ "${CEPH_OSD_MAP_STATUS}" ]]
then
    echo 0
else
    echo 1
fi
