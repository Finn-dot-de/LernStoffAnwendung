package login

import (
	"encoding/json"
	"net/http"

	"github.com/Finn-dot-de/LernStoffAnwendung/src/SQL"
	"github.com/Finn-dot-de/LernStoffAnwendung/src/structs"
)

func LoginHandler(w http.ResponseWriter, r *http.Request) {
	var loginData structs.LoginData
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
