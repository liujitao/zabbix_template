@echo off
setlocal enabledelayedexpansion
cd "C:\Program Files\MegaCli\"
for /f "tokens=2 delims=:" %%i in ('MegaCli64.exe -LDInfo -L%1 -aALL -NoLog ^|findstr /i /r /c:"^RAID Level *:"') do (
	set RAID_Level=%%i
	set RAID_Level=!RAID_Level:~1!
)
for /f "tokens=2 delims=:" %%i in ('MegaCli64.exe -LDInfo -L%1 -aALL -NoLog ^|findstr /i /r /c:"^Span Depth *:"') do (
	set Span_Depth=%%i
	set Span_Depth=!Span_Depth:~1!
)
for /f "tokens=2 delims=:" %%i in ('MegaCli64.exe -LDInfo -L%1 -aALL -NoLog ^|findstr /i /r /c:"^Number Of Drives.* *:"') do (
	set Drives=%%i
	set Drives=!Drives:~1!
)
for /f "tokens=2 delims=:" %%i in ('MegaCli64.exe -LDInfo -L%1 -aALL -NoLog ^|findstr /i /r /c:"^Number of Dedicated Hot Spares *:"') do (
	set Hot_Spares=%%i
	set Hot_Spares=!Hot_Spares:~1!
)
if not defined Span_Depth (
	set Span_Depth=0
)
if not defined Drives (
	set Drives=0
)
if not defined Hot_Spares (
	set Hot_Spares=0
)
if "%RAID_Level%" == "Primary-0, Secondary-0, RAID Level Qualifier-0" (
	set Level=RAID0
)
if "%RAID_Level%" == "Primary-1, Secondary-0, RAID Level Qualifier-0" (
	if %Span_Depth% equ 1 (
		set RAID_Level=RAID1
	)
	if %Span_Depth% gtr 1 (
		set RAID_Level=RAID10
	)
)
if "%RAID_Level%" == "Primary-5, Secondary-0, RAID Level Qualifier-3" (
	set RAID_Level=RAID5
)
if "%RAID_Level%" == "Primary-6, Secondary-0, RAID Level Qualifier-3" (
	set RAID_Level=RAID6
)
if "%RAID_Level%" == "Primary-1, Secondary-3, RAID Level Qualifier-0" (
	set RAID_Level=RAID10
)
if not defined RAID_Level (
	set RAID_Level=Unknown
)
set /a Disks=%Drives%*%Span_Depth%
echo %RAID_Level% (Disks: %Disks%, Hot Spares: %Hot_Spares%)