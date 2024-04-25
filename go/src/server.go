package main

import (
	"net/http"

	"github.com/Finn-dot-de/LernStoffAnwendung/src/SQL"
)

func main() {
	db, err := SQL.ConnectToDB()
	if err != nil {
		panic(err)
	}
	defer db.Close()

	fs := http.FileServer(http.Dir("../../frontend/dist/test"))
	http.Handle("/", fs)

	http.ListenAndServe(":8080", nil)
}
