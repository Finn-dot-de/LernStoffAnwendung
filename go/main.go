package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq" // Importieren des PostgreSQL-Treibers
)

func main() {
	// Konstanten für die Datenbankverbindung
	const (
		host     = "localhost"       // Der Hostname der Datenbank
		port     = 5432              // Der Port, auf dem die Datenbank läuft
		user     = "dein_username"   // Dein Datenbankbenutzername
		password = "dein_passwort"   // Dein Datenbankpasswort
		dbname   = "deine_datenbank" // Der Name der Datenbank
	)

	// Verbindungsstring zusammenstellen
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	// Versuch, eine Verbindung zur Datenbank herzustellen
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		log.Fatal(err) // Bei einem Fehler wird das Programm beendet
	}
	defer db.Close() // Stellt sicher, dass die Datenbankverbindung geschlossen wird

	// Überprüfen, ob die Datenbankverbindung funktioniert
	err = db.Ping()
	if err != nil {
		log.Fatal(err) // Bei einem Fehler wird das Programm beendet
	}

	// Erfolgsmeldung ausgeben
	fmt.Println("Erfolgreich verbunden!")
}
