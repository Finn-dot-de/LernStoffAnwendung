package main

import (
  "encoding/json"
  "log"
  "net/http"

  "github.com/Finn-dot-de/LernStoffAnwendung/src/SQL"
  "github.com/go-chi/chi"
)

type LoginData struct {
  Username string `json:"username"`
  Password string `json:"password"`
}

func loginHandler(w http.ResponseWriter, r *http.Request) {
  var loginData LoginData
  err := json.NewDecoder(r.Body).Decode(&loginData)
  if err != nil {
    http.Error(w, "Invalid request payload", http.StatusBadRequest)
    return
  }

  // Hier können Sie den Benutzernamen und das gehashte Passwort mit der Datenbank abgleichen
  // Zum Beispiel:
  user, err := SQL.GetUserByUsername(loginData.Username)
  if err != nil || !SQL.CheckPasswordHash(loginData.Password, user.Password) {
    http.Error(w, "Invalid username or password", http.StatusUnauthorized)
    return
  }

  w.WriteHeader(http.StatusOK)
  json.NewEncoder(w).Encode(map[string]string{"message": "Login successful"})
}

func main() {
  // Verbindung zur Datenbank herstellen
  db, err := SQL.ConnectToDB()
  if err != nil {
    panic(err)
  }
  defer db.Close()

  r := chi.NewRouter()

  // Statische Dateien servieren (z. B. für Angular-Anwendung)
  fs := http.FileServer(http.Dir("./project"))
  r.Handle("/*", http.StripPrefix("/", fs))

  // API-Endpunkte
  r.Get("/api/fragen", func(w http.ResponseWriter, r *http.Request) {
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

  // Login-Handler
  r.Post("/api/login", loginHandler)

  // Server starten und auf Port 8080 lauschen
  log.Println("Der Server läuft auf 8080!!")
  log.Fatal(http.ListenAndServe(":8080", r))
}
