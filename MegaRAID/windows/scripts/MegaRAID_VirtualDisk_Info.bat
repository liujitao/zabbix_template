@echo off
setlocal enabledelayedexpansion
cd "C:\Program Files\MegaCli\"
set str=%2
set str=%str:"=%
for /f "tokens=2 delims=:" %%i in ('MegaCli64.exe -LDInfo -L%1 -aALL -NoLog ^|findstr /i /r /c:"^%str% *:"') do (
	set VirtualDisk_Info=%%i
	set VirtualDisk_Info=!VirtualDisk_Info:~1!
	goto :end
)
:end
if defined VirtualDisk_Info (
	echo !VirtualDisk_Info!
) else (
	echo Unknown
)