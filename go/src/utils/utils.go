package utils

import (
	"log"
	"net/http"
	"time"
)

func LoggerMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		start := time.Now()
		log.Printf("Startzeit: %s | Methode: %s | URL: %s | RemoteAddr: %s", start.Format(time.RFC1123), r.Method, r.RequestURI, r.RemoteAddr)
		next.ServeHTTP(w, r)
		end := time.Now()
		log.Printf("Endzeit: %s | Dauer: %s", end.Format(time.RFC1123), end.Sub(start))
	})
}
