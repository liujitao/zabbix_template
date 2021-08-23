@echo off
setlocal enabledelayedexpansion
cd "C:\Program Files\MegaCli\"
set file=C:\Adapter.txt
if exist !file! (
	del !file!
)
for /f "delims=" %%i in ('MegaCli64.exe -AdpAllInfo -aALL -NoLog ^|findstr /c:"Adapter #"') do (
	set Adapter=%%i
	set Adapter={"{#ADAPTER}":"!Adapter:~9!"},
	set /p=!Adapter!<nul>>!file!
)
for /f "delims=" %%i in (!file!) do (
	set Adapter=%%i
	set Adapter="{"data":[!Adapter:~0,-1!]}"
	set /p=!Adapter!<nul
)
del !file!