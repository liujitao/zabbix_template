#!/bin/bash
VirtualDisk_Info=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -LDInfo -L$1 -aALL -NoLog |egrep -i "^\<$2\>[[:space:]]*:" |sed -n 1p |sed "s/^$2[[:space:]]*:[[:space:]]*//ig")
printf "${VirtualDisk_Info:-Unknown}\n"
