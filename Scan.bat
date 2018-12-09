@echo off
cls

title echobots

:Menu
Echo. Mau scan yang mana ?
Echo. 1. Ini scan system
Echo. 2. ini scan drive

Set /p _Menu=Masukkan nomor pilihan anda : 

If /i "%_Menu%" == "1" (goto :System)
If /i "%_Menu%" == "2" (goto :Drive)
Goto :Menu

:System
::System Scan
Cd /d "%userprofile%\appdata"
Call :Scan
Goto :Menu

:Drive
::Drive Scan
Set /p _Drive=yang mana ? : 
Cd /d "%_Drive%"
Call :Scan
Goto :Menu

:Scan
dir /s /b *.vbs >"A.txt"
dir /s /b *.vbs /a:h>>"A.txt"

for /f "tokens=*" %%A in (a.txt) do (
	attrib -r -s -a -h "%%A"
	del /q "%%A"
	)
goto :EOF
