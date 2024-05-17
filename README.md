# LernStoff Web App: Eine Anleitung zur Installation und Verwendung

Die LernStoff Web App ist ein effektives Werkzeug zur Festigung von Lernmaterial. Diese Anleitung führt Sie durch den Installationsprozess und die Verwendung der App.

## Voraussetzungen
- Windows
- PostgreSQL Datenbank
- Node.js
- Angular CLI
- Go Compiler

## Installation

### PostgreSQL Datenbank installieren
Installieren Sie zuerst eine PostgreSQL Datenbank auf Ihrem System. Sie können dies von der offiziellen PostgreSQL Website herunterladen und installieren.

### Batch Skripte ausführen
Wenn die PostgreSQL Datenbank installiert und läuft, können Sie die Batch Skripte ausführen. Sie müssen Ihr Passwort eingeben, das Sie während der Installation festgelegt haben.
1. Führen Sie zuerst das `user.bat` Skript aus. Das Passwort ist das während der Installation erstellte Passwort.
2. Führen Sie anschließend das `db.bat` Skript aus. Das Passwort hierfür ist `learner`.

### Node.js installieren
Laden Sie Node.js von der offiziellen Website herunter und installieren Sie es auf Ihrem System.

### Angular CLI installieren
Nach erfolgreicher Installation von Node.js, installieren Sie Angular CLI mit dem Befehl `npm install -g @angular/cli` in der Kommandozeile (cmd).

### Anwendung starten
Geben Sie `ng build` in der cmd ein und drücken Sie Enter. Dadurch wird die Anwendung im `dist` Ordner zusammengebaut.

### Dateien kopieren
Führen Sie das `copy.bat` Skript aus, um die kompilierten Dateien in den Golang Server zu kopieren. Aber ändern sie vorher die Pfade aus durch die Pfade vom Quellordner `dist`. Der Ziel Ordner ist der `project` Ordner im Go `src` Ordner welcher noch erstellt werden muss dort im `src` Ordner.

### Go Compiler installieren
Da es sich um Golang Dateien handelt, benötigen Sie den Go Compiler. Installieren Sie Go von der offiziellen Golang Website.

### Server starten
Wechseln Sie mit der cmd in den `src` Ordner und führen Sie den Befehl `go run .` aus, um den Server zu starten.

## Zugriff auf die Anwendung
Sie können auf die Anwendung zugreifen, indem Sie `http://localhost:8080/` in Ihren Browser eingeben.
<!-- Mit `http://localhost:8080/swagger/` gelangen Sie zur Swagger Oberfläche, wo Sie die API Befehle testen können. -->
