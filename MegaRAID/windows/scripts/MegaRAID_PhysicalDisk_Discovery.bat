@echo off
setlocal enabledelayedexpansion
cd "C:\Program Files\MegaCli\"
set file=C:\PhysicalDisk.txt
if exist !file! (
	del !file!
)
for /f "delims=" %%i in ('MegaCli64.exe -PDList -aALL -NoLog ^|findstr /c:"Enclosure Device ID:" /c:"Slot Number:"') do (
	set PhysicalDisk=%%i
	set PhysicalDisk=!PhysicalDisk:Enclosure Device ID: ={"{#PDISK}":"!
        set PhysicalDisk=!PhysicalDisk:Slot Number: =!
	if defined flag (
                set PhysicalDisk=:!PhysicalDisk!"},
		set flag=
		set /p=!PhysicalDisk!<nul>>!file!
	) else (
 		set flag=1
		set /p=!PhysicalDisk!<nul>>!file!
	)
)
for /f "delims=" %%i in (!file!) do (
	set PhysicalDisk=%%i
	set PhysicalDisk="{"data":[!PhysicalDisk:~0,-1!]}"
	set /p=!PhysicalDisk!<nul
)
del !file!