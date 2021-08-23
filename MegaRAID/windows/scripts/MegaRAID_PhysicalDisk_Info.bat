@echo off
setlocal enabledelayedexpansion
cd "C:\Program Files\MegaCli\"
set str=%2
set str=%str:"=%
for /f "tokens=2 delims=:" %%i in ('MegaCli64.exe -pdInfo -PhysDrv [%1] -aALL -NoLog ^|findstr /i /r /c:"^%str% *:"') do (
	set PhysicalDisk_Info=%%i
	set PhysicalDisk_Info=!PhysicalDisk_Info:~1!
	goto :end
)
:end
if defined PhysicalDisk_Info (
	echo !PhysicalDisk_Info!
) else (
	echo Unknown
)