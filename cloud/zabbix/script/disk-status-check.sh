#!/bin/sh

#devices=$(smartctl --scan-open | awk -F "-d" '{print $1}')
devices=$1
for device in $devices;
  do
    device_stat=$(smartctl -H $device | grep "Health" | awk -F ": " '{print $2}')
    if [[ $device_stat == "OK" ]];then
      echo "PASSED"
    else
      echo "PROBLEM"
    fi
done
