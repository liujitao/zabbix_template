#!/bin/bash
VDISK=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -LDInfo -LALL -aALL -NoLog |egrep -i -o "^\<Virtual Drive:[[:space:]]*[[:digit:]]+\>" |egrep -o "[[:digit:]]+" |sed "s/^\(.*\)$/{\"{#VDISK}\":\"\1\"}/g" |tr '\n' ',')
printf "{\"data\":[${VDISK%?}]}\n"
