package controller

import (
"github.com/jmoiron/sqlx"

"net/http"
)

type Articles struct {
	DB *sqlx.DB
}

func (a *Articles) Get(w http.ResponseWriter, r *http.Request) error {
	return nil
}
