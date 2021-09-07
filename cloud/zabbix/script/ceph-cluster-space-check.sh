#!/bin/sh

CHECK_ITEM=$1
if [[ $CHECK_ITEM == "total" ]]; then
  ceph df | head -3 | sed -n 3p | awk '{print $1}' | awk -F "G" '{print $1}'
fi

if [[ $CHECK_ITEM == "avail" ]]; then
  ceph df | head -3 | sed -n 3p | awk '{print $2}' | awk -F "G" '{print $1}'
fi

if [[ $CHECK_ITEM == "used" ]]; then
  ceph df | head -3 | sed -n 3p | awk '{print $3}' | awk -F "G" '{print $1}'
fi
