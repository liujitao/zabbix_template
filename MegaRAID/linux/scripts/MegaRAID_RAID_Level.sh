#!/bin/bash
RAID_Level=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -LDInfo -L$1 -aALL -NoLog |egrep -i "^\<RAID Level\>[[:space:]]*:" |sed -n 1p |sed "s/^RAID Level[[:space:]]*:[[:space:]]*//ig")
Span_Depth=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -LDInfo -L$1 -aALL -NoLog |egrep -i "^\<Span Depth\>[[:space:]]*:" |sed -n 1p |sed "s/^Span Depth[[:space:]]*:[[:space:]]*//ig")
Drives=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -LDInfo -L$1 -aALL -NoLog |egrep -i "^\<Number Of Drives\>.*[[:space:]]*:" |sed -n 1p |sed "s/^Number Of Drives.*[[:space:]]*:[[:space:]]*//ig")
Hot_Spares=$(sudo /opt/MegaRAID/MegaCli/MegaCli64 -LDInfo -L$1 -aALL -NoLog |egrep -i "^\<Number of Dedicated Hot Spares\>.*[[:space:]]*:" |sed -n 1p |sed "s/^Number of Dedicated Hot Spares[[:space:]]*:[[:space:]]*//ig")
case "${RAID_Level}" in
        "Primary-0, Secondary-0, RAID Level Qualifier-0")
                RAID_Level=RAID0
                ;;
        "Primary-1, Secondary-0, RAID Level Qualifier-0")
                [ "${Span_Depth}" -eq 1 ] && RAID_Level=RAID1
                [ "${Span_Depth}" -gt 1 ] && RAID_Level=RAID10
                ;;
        "Primary-5, Secondary-0, RAID Level Qualifier-3")
                RAID_Level=RAID5
                ;;
        "Primary-6, Secondary-0, RAID Level Qualifier-3")
                RAID_Level=RAID6
                ;;
        "Primary-1, Secondary-3, RAID Level Qualifier-0")
                RAID_Level=RAID10
                ;;
        *)
                RAID_Level=Unknown
                ;;
esac
Disks=$(( ${Drives:-0} * ${Span_Depth:-0} ))
printf "$RAID_Level (Disks: ${Disks}, Hot Spaces: ${Hot_Spares:-0})\n"
