-- Falls Schema vorhanden wird es gelöscht
DROP SCHEMA IF EXISTS quizschema CASCADE;

-- Erstellen des Schemas "quizschema"
CREATE SCHEMA IF NOT EXISTS quizschema AUTHORIZATION learner;

-- Erstellen der Tabelle "themen" im Schema "quizschema"
CREATE TABLE quizschema.themen (
    thema_id SERIAL PRIMARY KEY,
    thema_name TEXT NOT NULL,
    beschreibung TEXT
);


CREATE TABLE quizschema.fragen (
    frage_id SERIAL PRIMARY KEY,
    frage_text TEXT,
    thema_id INT REFERENCES quizschema.themen(thema_id)
);

CREATE TABLE quizschema.moegliche_antworten (
    antwort_id SERIAL PRIMARY KEY,
    frage_id INT REFERENCES quizschema.fragen(frage_id),
    antwort_text TEXT,
    ist_korrekt BOOLEAN
);

-- Tabelle "Benutzer"
CREATE TABLE quizschema.benutzer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Tabelle "Benutzer_login"
CREATE TABLE quizschema.benutzer_login (
    id SERIAL PRIMARY KEY,
    passwort VARCHAR(255) NOT NULL,
    benutzer_id INT REFERENCES quizschema.benutzer(id)
);

INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('ITS', 'Netzwerktechnik IT-Systeme');
INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('BWP', 'Betriebswirtschaftliche Prozesse');
INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('AWP', 'Anwendungsentwicklung und Programmierung');
INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('PuG', 'Politik und Gesellschaft');
INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('PlusD', 'Plus Deutsch');
INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('ITTk', 'IT-Technik kaufmännisch');
INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('ITTa / ITTab', 'IT-Technik ab und a');

---------------------------- Fragen ------------------------------------:

-- Fragen zum Thema Netzwerktechnik einfügen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist die maximale Datenübertragungsrate (Geschwindigkeit) von Ethernet?', 1);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist ein DHCP-Server?', 1);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist eine IP-Adresse?', 1);

-- Mögliche Antworten für die erste Netzwerktechnik-Frage einfügen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (1, '1 Gbit/s', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (1, '100 Mbit/s', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (1, '10 Gbit/s', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (1, '1 Mbit/s', FALSE);

-- Mögliche Antworten für die zweite Netzwerktechnik-Frage einfügen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (2, 'Ein Server, der automatisch IP-Adressen an Clients im Netzwerk zuweist', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (2, 'Ein Server, der Dateien im Netzwerk speichert', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (2, 'Ein Server, der den Internetzugang für das Netzwerk bereitstellt', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (2, 'Ein Server, der E-Mails im Netzwerk verteilt', FALSE);

-- Mögliche Antworten für die dritte Netzwerktechnik-Frage einfügen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (3, 'Eine eindeutige Kennung, die einem Gerät in einem Netzwerk zugewiesen ist', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (3, 'Ein Name für ein Netzwerkgerät', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (3, 'Eine eindeutige Kennung für ein Gerät im Internet', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (3, 'Eine Adresse für die physische Position eines Netzwerkgeräts', FALSE);

-- Fragen zum Thema C# einfügen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist der Unterschied zwischen "==" und ".Equals()" in C#?', 3);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist eine Ausnahme (Exception) in C#?', 3);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was bedeutet "static" in C#?', 3);

-- Mögliche Antworten für die erste C#-Frage einfügen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, '==" vergleicht die Referenzen, während .Equals() den Inhalt vergleicht.', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, '==" vergleicht den Inhalt, während .Equals() die Referenzen vergleicht.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, 'Es gibt keinen Unterschied, sie tun dasselbe.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, '==" und .Equals() sind Synonyme.', FALSE);

-- Mögliche Antworten für die zweite C#-Frage einfügen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Ereignis, das während der Ausführung eines Programms auftritt und den normalen Ablauf unterbricht.', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Fehler im Code, der nicht kompiliert werden kann.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein spezieller Datentyp in C#.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Rückgabewert einer Methode in C#.', FALSE);

-- Mögliche Antworten für die dritte C#-Frage einfügen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Es kennzeichnet eine Methode oder Variable als gemeinsam für alle Instanzen einer Klasse.', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Es kennzeichnet eine Methode oder Variable als nicht veränderbar.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Es kennzeichnet eine Methode oder Variable als konstant.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Es kennzeichnet eine Methode oder Variable als dynamisch.', FALSE);

------------------ Fragen ---------------------------
-- Gruppierung der Fragen und der 
-- SELECT
--     f.frage_id,
--     f.frage_text,
--     ARRAY_AGG(ma.antwort_text) AS moegliche_antworten,
--     ARRAY_AGG(ma.ist_korrekt) AS korrekte_antworten
-- FROM
--     quizschema.fragen AS f
-- INNER JOIN
--     quizschema.moegliche_antworten AS ma ON f.frage_id = ma.frage_id
-- GROUP BY
--     f.frage_id,
--     f.frage_text
-- ORDER BY
--     f.frage_id;