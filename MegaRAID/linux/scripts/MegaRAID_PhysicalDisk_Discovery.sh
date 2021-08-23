#!/bin/bash
PhysicalDisk=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -PDList -aALL -NoLog |egrep -i "^\<(Enclosure Device ID|Slot Number)\>[[:space:]]*:" |sed -e "N;s/\nSlot Number[[:space:]]*:[[:space:]]*\(.*\)/:\1\"}/ig" -e "s/Enclosure Device ID[[:space:]]*:[[:space:]]*/{\"{#PDISK}\":\"/ig" |tr '\n' ',')
printf "{\"data\":[${PhysicalDisk%?}]}\n"
