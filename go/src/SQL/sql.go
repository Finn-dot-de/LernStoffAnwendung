// Das Paket SQL enthält die Funktionen zur Interaktion mit der Datenbank.
package SQL

// Importieren der notwendigen Pakete.
import (
	"database/sql" // Paket für die Interaktion mit SQL-Datenbanken.
	"fmt"          // Paket für formatierte E/A.

	_ "github.com/lib/pq" // PostgreSQL-Treiber.
)

// ConnectToDB stellt eine Verbindung zur Datenbank her und gibt diese zurück.
func ConnectToDB() (*sql.DB, error) {
	// Konstanten für die Datenbankverbindung.
	const (
		host     = "localhost" // Der Host der Datenbank.
		port     = 5432        // Der Port der Datenbank.
		user     = "learner"   // Der Benutzername für die Datenbank.
		password = "learner"   // Das Passwort für die Datenbank.
		dbname   = "quizdb"    // Der Name der Datenbank.
	)

	// Erstellen der Verbindungszeichenkette.
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	// Versuch, eine Verbindung zur Datenbank herzustellen.
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		// Wenn ein Fehler auftritt, gibt nil und den Fehler zurück.
		return nil, err
	}

	// Versuch, die Datenbank anzupingen.
	err = db.Ping()
	if err != nil {
		// Wenn ein Fehler auftritt, gibt nil und den Fehler zurück.
		return nil, err
	}

	// Wenn die Verbindung erfolgreich hergestellt wurde, wird eine Erfolgsmeldung gedruckt.
	fmt.Println("Successfully connected!")
	// Geben Sie die Datenbankverbindung und nil für den Fehler zurück.
	return db, nil
}
