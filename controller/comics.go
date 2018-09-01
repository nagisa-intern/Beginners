package controller

import (
"github.com/jmoiron/sqlx"

"net/http"
	"encoding/json"
	"github.com/gorilla/mux"
	)

type Comics struct {
	DB *sqlx.DB
}

type Sample struct {
	Text string `json:"text"`
	Caption string `json:"caption"`
}

func JSON(w http.ResponseWriter, code int, data interface{}) error {
	w.WriteHeader(code)
	return json.NewEncoder(w).Encode(data)
}


func (a *Comics) Get(w http.ResponseWriter, r *http.Request) error {

	comicColor := mux.Vars(r)["color"]
	w.Header().Set("Location", "api/comics/"+comicColor)

	comics := []Sample{
		{Text: comicColor, Caption: "gugaguga"}, {Caption: "hogehoeeee"}}

	return JSON(w, http.StatusOK, comics)

	return nil
}
