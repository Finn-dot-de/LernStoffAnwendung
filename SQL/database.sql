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
INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('ITTk', 'IT-Technik kaufmaennisch');
INSERT INTO quizschema.themen (thema_name, beschreibung) VALUES ('ITTa / ITTab', 'IT-Technik ab und a');

INSERT INTO quizschema.benutzer(name) VALUES ('Test');
INSERT INTO quizschema.benutzer_login(passwort, benutzer_id) VALUES ('936a185caaa266bb9cbe981e9e05cb78cd732b0b3280eb944412bb6f8f8f07af', 1);

------------------------------------------------------------------------------------------------------------------------------------------:

-------------------------------------------------------- Fragen --------------------------------------------------------------------------:

------------------------------------------------------------------------------------------------------------------------------------------:
-- Fragen zum Thema Netzwerktechnik einfuegen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist die maximale Datenuebertragungsrate (Geschwindigkeit) von Ethernet?', 1);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist ein DHCP-Server?', 1);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist eine IP-Adresse?', 1);

-- Mögliche Antworten fuer die erste Netzwerktechnik-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (1, '1 Gbit/s', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (1, '100 Mbit/s', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (1, '10 Gbit/s', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (1, '1 Mbit/s', FALSE);

-- Mögliche Antworten fuer die zweite Netzwerktechnik-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (2, 'Ein Server, der automatisch IP-Adressen an Clients im Netzwerk zuweist', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (2, 'Ein Server, der Dateien im Netzwerk speichert', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (2, 'Ein Server, der den Internetzugang fuer das Netzwerk bereitstellt', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (2, 'Ein Server, der E-Mails im Netzwerk verteilt', FALSE);

-- Mögliche Antworten fuer die dritte Netzwerktechnik-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (3, 'Eine eindeutige Kennung, die einem Geraet in einem Netzwerk zugewiesen ist', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (3, 'Ein Name fuer ein Netzwerkgeraet', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (3, 'Eine eindeutige Kennung fuer ein Geraet im Internet', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (3, 'Eine Adresse fuer die physische Position eines Netzwerkgeraets', FALSE);

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fragen zum Thema Betriebswirtschaftliche Prozesse einfuegen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was versteht man unter dem Begriff "ROI" in der Betriebswirtschaft?', 2);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist ein Businessplan?', 2);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was bedeutet "Cashflow" in der betriebswirtschaftlichen Analyse?', 2);

-- Mögliche Antworten fuer die erste Betriebswirtschaftliche Prozesse-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, 'Return on Investment', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, 'ROI', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, 'Rückkehr der Investition', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, 'Ratio of Investment', FALSE);

-- Mögliche Antworten fuer die zweite Betriebswirtschaftliche Prozesse-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein schriftlicher Plan, der die Geschäftsidee, Ziele, Strategien und Finanzprognosen eines Unternehmens darstellt', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Plan, der die Ziele eines Unternehmens beschreibt', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Plan, der die Finanzierung eines Unternehmens festlegt', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Plan, der die Unternehmensstruktur definiert', FALSE);

-- Mögliche Antworten fuer die dritte Betriebswirtschaftliche Prozesse-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Der Zufluss und Abfluss von Bargeld in einem Unternehmen zu einem bestimmten Zeitpunkt', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Die finanzielle Leistungsfähigkeit eines Unternehmens', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Die Bilanzsumme eines Unternehmens', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Der Umsatz eines Unternehmens', FALSE);

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fragen zum Thema C# einfuegen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist der Unterschied zwischen "==" und ".Equals()" in C#?', 3);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist eine Ausnahme (Exception) in C#?', 3);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was bedeutet "static" in C#?', 3);

-- Mögliche Antworten fuer die erste C#-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, '==" vergleicht die Referenzen, waehrend .Equals() den Inhalt vergleicht.', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, '==" vergleicht den Inhalt, waehrend .Equals() die Referenzen vergleicht.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, 'Es gibt keinen Unterschied, sie tun dasselbe.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (4, '==" und .Equals() sind Synonyme.', FALSE);

-- Mögliche Antworten fuer die zweite C#-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Ereignis, das waehrend der Ausfuehrung eines Programms auftritt und den normalen Ablauf unterbricht.', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Fehler im Code, der nicht kompiliert werden kann.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein spezieller Datentyp in C#.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (5, 'Ein Rueckgabewert einer Methode in C#.', FALSE);

-- Mögliche Antworten fuer die dritte C#-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Es kennzeichnet eine Methode oder Variable als gemeinsam fuer alle Instanzen einer Klasse.', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Es kennzeichnet eine Methode oder Variable als nicht veraenderbar.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Es kennzeichnet eine Methode oder Variable als konstant.', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (6, 'Es kennzeichnet eine Methode oder Variable als dynamisch.', FALSE);

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fragen zum Thema Anwendungsentwicklung und Programmierung einfuegen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist ein Compiler?', 3);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was versteht man unter dem Begriff "Objektorientierte Programmierung"?', 3);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist der Unterschied zwischen "Syntax" und "Semantik" in der Programmierung?', 3);

-- Mögliche Antworten fuer die erste Anwendungsentwicklung und Programmierung-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (7, 'Ein Programm, das Quellcode in Maschinencode umwandelt', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (7, 'Ein Programm, das maschinennahen Code optimiert', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (7, 'Ein Programm, das Fehler im Quellcode findet', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (7, 'Ein Programm, das Programme ausführt', FALSE);

-- Mögliche Antworten fuer die zweite Anwendungsentwicklung und Programmierung-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (8, 'Ein Programmierparadigma, das auf der Verwendung von Objekten und Klassen basiert', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (8, 'Ein Programmierparadigma, das die Wiederverwendbarkeit von Code fördert', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (8, 'Ein Programmierstil, der imperative und deklarative Konzepte kombiniert', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (8, 'Ein Programmierstil, der auf prozeduralen Ansätzen basiert', FALSE);

-- Mögliche Antworten fuer die dritte Anwendungsentwicklung und Programmierung-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (9, 'Die Syntax beschreibt die korrekte Grammatik und Struktur von Code, während die Semantik die Bedeutung des Codes definiert', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (9, 'Die Syntax beschreibt die Ausführungsreihenfolge des Codes, während die Semantik die Fehler überprüft', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (9, 'Die Syntax beschreibt die Variablen und Funktionen im Code, während die Semantik die Datentypen definiert', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (9, 'Die Syntax beschreibt die logische Struktur des Codes, während die Semantik die Ausführungsumgebung definiert', FALSE);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fragen zum Thema Politik und Gesellschaft einfuegen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was bedeutet Demokratie?', 4);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was sind die Grundprinzipien der Menschenrechte?', 4);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist ein politisches System?', 4);

-- Mögliche Antworten fuer die erste Politik und Gesellschaft-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (10, 'Eine Regierungsform, bei der die Bürger an der Entscheidungsfindung beteiligt sind und ihre Rechte durch Wahlen ausüben', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (10, 'Eine Regierungsform, die auf Prinzipien der Gewaltenteilung und Rechtsstaatlichkeit beruht', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (10, 'Eine Regierungsform, bei der eine einzelne Person alle Macht hat', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (10, 'Eine Regierungsform, bei der die Macht durch eine religiöse Institution ausgeübt wird', FALSE);

-- Mögliche Antworten fuer die zweite Politik und Gesellschaft-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (11, 'Unveräußerliche Rechte, die allen Menschen unabhängig von ihrer Nationalität, Wohnort, Geschlecht, ethnischer Zugehörigkeit, Religion oder sonstigen Merkmalen zustehen', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (11, 'Rechte, die nur bestimmten Gruppen von Menschen zustehen', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (11, 'Rechte, die von den Regierungen nach Belieben gewährt oder entzogen werden können', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (11, 'Rechte, die nur in westlichen Ländern gelten', FALSE);

-- Mögliche Antworten fuer die dritte Politik und Gesellschaft-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (12, 'Ein System, das die Organisation und Verteilung politischer Macht in einer Gesellschaft regelt', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (12, 'Ein System, das ausschließlich auf politischen Konsens setzt', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (12, 'Ein System, das keine politischen Institutionen hat', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (12, 'Ein System, das auf rein wirtschaftlichen Prinzipien basiert', FALSE);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fragen zum Thema Plus Deutsch einfuegen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was versteht man unter einem "Synonym"?', 5);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was sind die drei Genera (Geschlechter) im Deutschen?', 5);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist der Unterschied zwischen "Dativ" und "Akkusativ" im Deutschen?', 5);

-- Mögliche Antworten fuer die erste Plus Deutsch-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (13, 'Ein Wort, das eine ähnliche Bedeutung wie ein anderes Wort hat', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (13, 'Ein Wort, das die genaue Gegenteilbedeutung eines anderen Wortes hat', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (13, 'Ein Wort, das in einer anderen Sprache verwendet wird', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (13, 'Ein Wort, das nur in speziellen Fachgebieten verwendet wird', FALSE);

-- Mögliche Antworten fuer die zweite Plus Deutsch-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (14, 'Maskulinum, Femininum, Neutrum', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (14, 'Singular, Plural, Dual', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (14, 'Nominativ, Genitiv, Dativ, Akkusativ', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (14, 'Einzahl, Mehrzahl', FALSE);

-- Mögliche Antworten fuer die dritte Plus Deutsch-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (15, 'Der Dativ beschreibt den indirekten Objektfall, während der Akkusativ den direkten Objektfall beschreibt', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (15, 'Der Dativ beschreibt den direkten Objektfall, während der Akkusativ den indirekten Objektfall beschreibt', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (15, 'Der Dativ beschreibt den Genitiv, während der Akkusativ den Dativ beschreibt', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (15, 'Der Dativ beschreibt den Nominativ, während der Akkusativ den Akkusativ beschreibt', FALSE);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fragen zum Thema IT-Technik kaufmaennisch einfuegen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist eine Warenwirtschaftssystem?', 6);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist eine CRM-Software?', 6);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was bedeutet "SAP" im Kontext von IT-Technik kaufmaennisch?', 6);

-- Mögliche Antworten fuer die erste IT-Technik kaufmaennisch-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (16, 'Ein Softwaresystem zur Steuerung von Geschäftsprozessen, insbesondere im Bereich Lagerhaltung, Logistik und Vertrieb', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (16, 'Ein Softwarepaket für die Buchhaltung', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (16, 'Ein spezialisiertes Betriebssystem für Unternehmen', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (16, 'Ein Programm zur Erstellung von Grafiken', FALSE);

-- Mögliche Antworten fuer die zweite IT-Technik kaufmaennisch-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (17, 'Customer Relationship Management - Software zur Verwaltung von Kundenbeziehungen und -daten', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (17, 'Computer Ressource Management - Software zur Optimierung von Hardware-Ressourcen', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (17, 'Content-Resource-Management - Software zur Verwaltung von digitalen Inhalten', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (17, 'Consumer Resource Management - Software zur Verwaltung von Endverbraucherdaten', FALSE);

-- Mögliche Antworten fuer die dritte IT-Technik kaufmaennisch-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (18, 'Systems, Applications, and Products in Data Processing - Eine integrierte Unternehmenssoftware, die verschiedene Geschäftsprozesse unterstützt', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (18, 'Service Applications and Platforms - Ein Framework für die Entwicklung von webbasierten Anwendungen', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (18, 'Software Architecture and Programming - Ein Ansatz zur Softwareentwicklung', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (18, 'Security and Privacy - Ein Bereich der Informationssicherheit', FALSE);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fragen zum Thema IT-Technik ab und a einfuegen
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist ein Betriebssystem?', 7);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was versteht man unter "Virtualisierung" in der IT-Technik?', 7);
INSERT INTO quizschema.fragen (frage_text, thema_id) VALUES ('Was ist ein RAID-System?', 7);

-- Mögliche Antworten fuer die erste IT-Technik ab und a-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (19, 'Ein Betriebssystem ist die grundlegende Software, die die Hardware eines Computers verwaltet und die Ausführung von Anwendungssoftware ermöglicht', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (19, 'Ein Betriebssystem ist eine Anwendung zur Verwaltung von Dateien', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (19, 'Ein Betriebssystem ist ein Programm, das die Leistung eines Computers verbessert', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (19, 'Ein Betriebssystem ist ein Programm, das Computerspiele ausführt', FALSE);

-- Mögliche Antworten fuer die zweite IT-Technik ab und a-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (20, 'Virtualisierung bezeichnet die Erstellung virtueller (nicht physischer) Versionen von Computern, Betriebssystemen, Speichergeräten oder Netzwerkressourcen', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (20, 'Virtualisierung bezeichnet die Verwendung von virtuellen Realitätsbrillen', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (20, 'Virtualisierung bezeichnet die Simulation von realen Ereignissen in einer virtuellen Umgebung', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (20, 'Virtualisierung bezeichnet die Verwendung von Cloud Computing', FALSE);

-- Mögliche Antworten fuer die dritte IT-Technik ab und a-Frage einfuegen
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (21, 'Ein RAID-System ist eine Methode zur Organisation von Festplatten in einem Computer, um Redundanz und/oder verbesserte Leistung zu erreichen', TRUE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (21, 'Ein RAID-System ist ein Sicherheitssystem für Netzwerke', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (21, 'Ein RAID-System ist eine Software zur Datenverschlüsselung', FALSE);
INSERT INTO quizschema.moegliche_antworten (frage_id, antwort_text, ist_korrekt) VALUES (21, 'Ein RAID-System ist ein Programm zur Datenrettung', FALSE);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------- Fragen -------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------