package main

import "net/http"

func main() {
	fs := http.FileServer(http.Dir("../../frontend/dist/test"))
	http.Handle("/", fs)

	http.ListenAndServe(":8080", nil)
}
