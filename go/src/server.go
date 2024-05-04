package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/Finn-dot-de/LernStoffAnwendung/src/SQL"
	httpSwagger "github.com/swaggo/http-swagger"
)

// @title Meine API Dokumentation
// @version 1.0
// @description Eine einfache API für mein Projekt.
// @host localhost:8080
// @BasePath /
func main() {
	// Verbindung zur Datenbank herstellen
	db, err := SQL.ConnectToDB()
	if err != nil {
		panic(err)
	}
	defer db.Close()

	// Statische Dateien servieren (z. B. für Angular-Anwendung und Swagger UI)
	fs := http.FileServer(http.Dir("./project"))
	http.Handle("/", http.StripPrefix("/", fs))

	// Handler für API-Endpunkt zum Abrufen von Fragen
	http.HandleFunc("/api/fragen", func(w http.ResponseWriter, r *http.Request) {
		// Fragen aus der Datenbank abrufen
		fragen, err := SQL.GetFragenFromDB(db)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		// JSON als Antwort senden
		w.Header().Set("Content-Type", "application/json")
		err = json.NewEncoder(w).Encode(fragen)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
	})

	// Swagger UI wird unter /swagger/ verfügbar sein
	http.Handle("/swagger/", httpSwagger.WrapHandler)

	// Server starten und auf Port 8080 lauschen
	log.Println("Der Server läuft auf 8080!!")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
