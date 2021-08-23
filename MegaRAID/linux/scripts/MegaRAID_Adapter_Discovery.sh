#!/bin/bash
Adapter=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -AdpAllInfo -aALL -NoLog |egrep -i "^\<Adapter\>[[:space:]]*#[[:digit:]]+" |egrep -o "[[:digit:]]+" |sed "s/^\(.*\)$/{\"{#ADAPTER}\":\"\1\"}/g" |tr '\n' ',')
printf "{\"data\":[${Adapter%?}]}\n"
