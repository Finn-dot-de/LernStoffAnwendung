@echo off
REM Setzen die Pfade entsprechend Ihren Anforderungen
set "FRONTEND_PFAD=../../frontend/"
set "DIST_PFAD=frontend/dist/test"
set "GO_SERVER=go/"
set "FERTIG_PFAD=Projekt_Fertig"
set "DATEI_PFAD=C:\DEV\LernStoffAnwendung\Projekt_Fertig\project"
set "EXE_NAME=Server.exe"
set "EXE_PFAD=go/Server.exe"

REM Bauen die Angular-Anwendung
cd %FRONTEND_PFAD%
call ng build

REM Überprüfen, ob der Zielordner existiert, wenn nicht, erstelle ihn
if not exist "%FERTIG_PFAD%" (
    cd ../
    mkdir "%FERTIG_PFAD%"
)

REM Kopieren die gebauten Dateien in den Zielordner
xcopy /e /i "%DIST_PFAD%\*" "%DATEI_PFAD%\"

REM Wechseln in den Go src Ordner und bauen den Server
cd %GO_SERVER%
call go build -o %EXE_NAME%

REM Überprüfen, ob die ausführbare Datei existiert, bevor sie kopiert wird
cd ../
if exist "%EXE_PFAD%" (
    copy "%EXE_PFAD%" "%FERTIG_PFAD%\"
    echo Exe kopiert
) else (
    echo Die ausführbare Datei wurde nicht gefunden.
)
echo Die Anwendung wurde erfolgreich gebaut, der Server wurde kompiliert und die ausführbare Datei wurde in den Zielordner kopiert.