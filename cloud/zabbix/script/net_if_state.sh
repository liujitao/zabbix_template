#!/bin/bash
DEVICE=$1
STATUS=`ip addr show $1 |grep -w "$1" |awk -F"," '{print $3}'`
#interface state is down retune 0, interface state is up retune 1
if [[ ${STATUS} == "UP" ]]
then
  echo 1
else 
  echo 0
fi
