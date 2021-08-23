#!/bin/bash
PhysicalDisk_Info=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -pdInfo -PhysDrv [$1] -aALL -NoLog |egrep -i "^\<$2\>[[:space:]]*:" |sed -n 1p |sed "s/^$2[[:space:]]*:[[:space:]]*//ig")
printf "${PhysicalDisk_Info:-Unknown}\n"
