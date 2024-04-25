-- Falls Schema vorhanden wird es gelöscht
DROP SCHEMA IF EXISTS quizschema CASCADE;

-- Erstellen des Schemas "quizschema"
CREATE SCHEMA IF NOT EXISTS quizschema AUTHORIZATION learner;

-- Nach dem Erstellen des Schemas können Sie die Tabellen erstellen
-- Erstellen der Tabelle "themen" im Schema "quizschema"
CREATE TABLE quizschema.themen (
    thema_id SERIAL PRIMARY KEY,
    thema_name TEXT NOT NULL,
    beschreibung TEXT
);

-- Erstellen einer Tabelle für Multiple-Choice-Fragen im Schema "quizschema"
CREATE TABLE quizschema.mc_quiz (
    frage_id SERIAL PRIMARY KEY,
    thema_id INT,
    frage TEXT NOT NULL,
    FOREIGN KEY (thema_id) REFERENCES quizschema.themen(thema_id)
);

-- Erstellen einer Tabelle für Antwortmöglichkeiten im Schema "quizschema"
CREATE TABLE quizschema.antwortmoeglichkeiten (
    antwort_id SERIAL PRIMARY KEY,
    frage_id INT,
    antwort_text TEXT NOT NULL,
    ist_richtig BOOLEAN NOT NULL,
    FOREIGN KEY (frage_id) REFERENCES quizschema.mc_quiz(frage_id)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Beispielbenutzer einfügen
INSERT INTO users (username, password, email) VALUES 
    ('max_mustermann', 'sicheres_passwort', 'max@example.com'),
    ('lisa_musterfrau', 'geheim123', 'lisa@example.com');

-- Beispiel: Einfügen einer Multiple-Choice-Frage und Antwortmöglichkeiten
-- Beachten Sie, dass die Referenzen jetzt das Schema "quizschema" enthalten
INSERT INTO quizschema.mc_quiz (thema_id, frage) VALUES
((SELECT thema_id FROM quizschema.themen WHERE thema_name = 'IT-Technik'), 'Was ist ein Router?');

INSERT INTO quizschema.antwortmoeglichkeiten (frage_id, antwort_text, ist_richtig) VALUES
((SELECT frage_id FROM quizschema.mc_quiz WHERE frage = 'Was ist ein Router?'), 'Ein Gerät, das Datenpakete zwischen Computernetzwerken weiterleitet.', TRUE),
((SELECT frage_id FROM quizschema.mc_quiz WHERE frage = 'Was ist ein Router?'), 'Ein Programm zur Fehlerdiagnose in Netzwerken.', FALSE),
((SELECT frage_id FROM quizschema.mc_quiz WHERE frage = 'Was ist ein Router?'), 'Ein Protokoll zur Datenübertragung.', FALSE),
((SELECT frage_id FROM quizschema.mc_quiz WHERE frage = 'Was ist ein Router?'), 'Eine Art von Malware.', FALSE);