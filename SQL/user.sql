-- Erstellen der Datenbank
CREATE DATABASE quizdb;

\c quizdb

-- Erstellen des Benutzers (dies muss vor dem Erstellen der Datenbank erfolgen)
CREATE USER learner WITH PASSWORD 'learner';
-- Berechtigungen für die Datenbank
GRANT ALL PRIVILEGES ON DATABASE quizdb TO learner;

-- Berechtigungen für das Schema
GRANT ALL PRIVILEGES ON SCHEMA quizschema TO learner;

-- Berechtigungen für alle Tabellen im Schema
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA quizschema TO learner;

-- Berechtigungen setzen
GRANT CONNECT ON DATABASE quizdb TO learner;