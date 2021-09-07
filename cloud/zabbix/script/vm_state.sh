#!/bin/bash
Vmid=`echo $1 |awk -F ":" '{print $2}'`
End_number=`grep "File_Finished" /etc/zabbix/script/vm.state.file |wc -l`
if [ $End_number -ne 1 ] ;then 
   sleep 5 
fi
Vmstate=`grep $Vmid  /etc/zabbix/script/vm.state.file  |awk '{print $3}'`
if [[ $Vmstate = "ACTIVE" ]] 
then
   echo 1
else
   echo 0
fi
