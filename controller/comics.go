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
	Color string `json:"color"`
	Title string `json:"title"`
	Author string `json:author`
	Summary string `json:summary`
}

func JSON(w http.ResponseWriter, code int, data interface{}) error {
	w.WriteHeader(code)
	return json.NewEncoder(w).Encode(data)
}


func (a *Comics) Get(w http.ResponseWriter, r *http.Request) error {

	comicColor := mux.Vars(r)["color"]
	w.Header().Set("Location", "api/comics/"+comicColor)

	comics := []Sample{
		{Color: comicColor, Title: "titleの１だよ", Author: "hogehoge", Summary: "ああああああああああああああああああああああ"},
		{Color: comicColor, Title: "２", Author: "hogehoge", Summary: "いいいいいいいいいいいいいいいいいい"}}

	return JSON(w, http.StatusOK, comics)

	return nil
}
