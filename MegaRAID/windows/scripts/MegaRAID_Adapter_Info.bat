@echo off
setlocal enabledelayedexpansion
cd "C:\Program Files\MegaCli\"
set str=%2
set str=%str:"=%
for /f "tokens=2 delims=:" %%i in ('MegaCli64.exe -AdpAllInfo -a%1 -NoLog ^|findstr /i /r /c:"^%str% *:"') do (
	set Adapter_Info=%%i
	set Adapter_Info=!Adapter_Info:~1!
	goto :end
)
:end
if defined Adapter_Info (
	echo !Adapter_Info!
) else (
	echo Unknown
)