package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = 5432
	user     = "learner"
	password = "learner"
	dbname   = "quizdb"
)

type Frage struct {
	ID        int    `json:"id"`
	ThemaID   int    `json:"thema_id"`
	FrageText string `json:"frage_text"`
}

func main() {
	// Verbindungsstring für die Datenbank
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	// Verbindung zur Datenbank herstellen
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Überprüfen, ob die Verbindung zur Datenbank funktioniert
	err = db.Ping()
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Server läuft auf Port 8080")
	log.Fatal(http.ListenAndServe(":8080", nil))

	// HTTP-Handler für die Route /fragen
	http.HandleFunc("/fragen", func(w http.ResponseWriter, r *http.Request) {
		// Abfrage aller Fragen aus der Datenbank
		rows, err := db.Query("SELECT * FROM quizschema.mc_quiz")
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		defer rows.Close()

		var fragen []Frage
		fmt.Printf("Hello World")

		// Iteration über die Ergebnismenge
		for rows.Next() {
			var f Frage
			if err := rows.Scan(&f.ID, &f.ThemaID, &f.FrageText); err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			fragen = append(fragen, f)
		}

		// Ausgabe der Fragen in der Konsole
		for _, frage := range fragen {
			fmt.Printf("ID: %d, ThemaID: %d, Frage: %s\n", frage.ID, frage.ThemaID, frage.FrageText)
		}

		// Setzen des Content-Type Headers auf application/json
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(fragen) // Senden der Fragen als JSON
	})

	// Starten des HTTP-Servers auf Port 8080
	log.Fatal(http.ListenAndServe(":8080", nil))
}
