#!/bin/bash
Adapter_Info=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -AdpAllInfo -a$1 -NoLog |egrep -i "^\<$2\>[[:space:]]*:" |sed -n 1p |sed "s/^$2[[:space:]]*:[[:space:]]*//ig")
printf "${Adapter_Info:-Unknown}\n"
