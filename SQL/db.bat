@echo off
echo Ausführung des SQL Scripts für die Erstellung der Datenbank
set base_path=%~dp0
psql -U learner -h localhost -p 5432 -d quizdb -c "learner" -f "%base_path%database.sql"
echo Script erfolgreich ausgeführt
