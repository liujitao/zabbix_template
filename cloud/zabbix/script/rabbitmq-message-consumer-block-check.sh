#!/bin/bash

# by caton wang

NODE_NAME=$1
BLOCK_STATUS=`rabbitmqctl list_queues messages consumers name|grep -E "[^ceilometer.agent.]compute\.${NODE_NAME}.domain"|awk '{print $2}'`

if [[ $BLOCK_STATUS == 1 ]]
then
    echo 1
else
   echo 0
fi
