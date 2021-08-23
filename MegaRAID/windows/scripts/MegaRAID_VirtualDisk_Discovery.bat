@echo off
setlocal enabledelayedexpansion
cd "C:\Program Files\MegaCli\"
set file=C:\VirtualDisk.txt
if exist !file! (
	del !file!
)
for /f "delims=" %%i in ('MegaCli64.exe -LDInfo -LALL -aALL -NoLog ^|findstr /c:"Virtual Drive:"') do (
	set VirtualDisk=%%i
	set VirtualDisk="{"{#VDISK}":"!VirtualDisk:~-3,2!"},"
	set VirtualDisk=!VirtualDisk: =!
	set /p=!VirtualDisk!<nul>>!file!	
)
for /f "delims=" %%i in (!file!) do (
	set VirtualDisk=%%i
	set VirtualDisk="{"data":[!VirtualDisk:~0,-1!]}"
	set /p=!VirtualDisk!<nul
)
del !file!