@echo off
set "quelle=C:\DEV\LernStoffWebApp\frontend\dist\test"
set "ziel=C:\DEV\LernStoffWebApp\go\src\project"
set "intervall=300"  REM Intervall in Sekunden (hier 300 Sekunden = 5 Minuten)

:LOOP
echo Kopiere Dateien von %quelle% nach %ziel%...

REM Erstelle das Zielverzeichnis, wenn es nicht vorhanden ist
if not exist "%ziel%" mkdir "%ziel%"

REM Kopiere die Dateien von der Quelle zum Ziel
xcopy "%quelle%\*" "%ziel%\" /s /i /y

echo Kopiervorgang abgeschlossen. Warte auf das nächste Intervall...

REM Warte für das angegebene Intervall (in Sekunden)
timeout /t %intervall%

REM Gehe zurück zur Schleifenmarke LOOP
goto LOOP