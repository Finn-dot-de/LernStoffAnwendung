@echo off
REM Setzen Sie die Pfade entsprechend Ihren Anforderungen
set "FRONTEND_PFAD=C:\Pfad\zu\Ihrem\dist\Ordner"
set "DIST_PFAD=../../frontend"
set "GO_SERVER=C:\Pfad\zu\Ihrem\Go\src\project\Ordner"
set "FERTIG_PFAD=./"
set EXE_NAME=Server.exe

REM Bauen Sie die Angular-Anwendung
cd %SOURCE_PATH%
call ng build

REM Überprüfen Sie, ob der Zielordner existiert, wenn nicht, erstellen Sie ihn
if not exist %TARGET_PATH% (
    mkdir %TARGET_PATH%
)

REM Kopieren Sie die gebauten Dateien in den Zielordner
xcopy /s /y %FRONTEND_PFAD%\* %FERTIG_PFAD%\

REM Wechseln Sie in den Go src Ordner und bauen Sie den Server
cd %GO_SERVER%
call go build -o %EXE_NAME%

REM Kopieren Sie die ausführbare Datei in den Zielordner
copy %EXE_NAME% %FERTIG_PFAD%\

echo Die Anwendung wurde erfolgreich gebaut, der Server wurde kompiliert und die ausführbare Datei wurde in den Zielordner kopiert.
pause
