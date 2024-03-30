@echo off
set base_path=%~dp0
echo Erstelle User for the learner database as "postgres" user
psql -U postgres -W -f "%base_path%user.sql"
echo Script wurde erfolgreich ausgeführt