#!/bin/bash

# by caton wang

CHECK_ITEM=$1
Perf_Data=$(ceph pg stat|awk -F";" '{print $3}')
if [[ $Perf_Data  = "" ]]
then
  echo 0
  exit
fi
if [[ $CHECK_ITEM == read ]]
then
    echo $Perf_Data |awk '{print $1}'
elif [[ $CHECK_ITEM == write ]]
then
    if [[ $(echo $Perf_Data |grep -w wr ) ]] 
    then
    echo $Perf_Data |awk '{print $4}'
    else
    echo 0
    fi
elif [[ $CHECK_ITEM == iops ]]
then
    if [[ $(echo $Perf_Data |grep -w wr ) ]] 
    then
    echo $Perf_Data |awk '{print $7}'
    else
    echo $Perf_Data |awk '{print $4}'
    fi
else

   echo 0

fi
