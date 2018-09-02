package controller

import (
"github.com/jmoiron/sqlx"

"net/http"
	"encoding/json"
	"github.com/gorilla/mux"
	"github.com/nagisa-intern/Beginners/model"
	"strconv"
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


func (c *Comics) Get(w http.ResponseWriter, r *http.Request) error {
		comicColor := mux.Vars(r)["color"]
		//w.Header().Set("Location", "api/comics/"+comicColor)

		comics, err := model.ComicOne(c.DB, comicColor)
		if err != nil {
		http.Error(w, "404 not found.", http.StatusNotFound)
		return nil
	}
		return JSON(w, http.StatusOK, struct {
		Comics []model.Comic `json:"comics"`
	}{
		Comics: comics,
	})
}

func (c *Comics) GetAll(w http.ResponseWriter, r *http.Request) error {
	comics, err := model.ComicsAll(c.DB)
	if err != nil {
		return err
	}
	return JSON(w, http.StatusOK, struct {
		Comics []model.Comic `json:"articles"`
	}{
		Comics: comics,
	})
}

func (c *Comics) GetAuthor(w http.ResponseWriter, r *http.Request) error {
	id := mux.Vars(r)["id"]
	//w.Header().Set("Location", "api/authors/"+id)
	idNum, err := strconv.ParseInt(id, 10, 64)


	authors, err := model.AuthorOne(c.DB, idNum)
	if err != nil {
		http.Error(w, "404 not found.", http.StatusNotFound)
		return nil
	}
	return JSON(w, http.StatusOK, struct {
		Authors []model.Author `json:"authors"`
	}{
		Authors: authors,
	})
}

func (c *Comics) Post(w http.ResponseWriter, r *http.Request, comicID int, comment string) error {
	var comicComment model.ComicComment

	if err := json.NewDecoder(r.Body).Decode(&comicComment); err != nil {
		return err
	}

	comicComment.ComicID = int64(comicID)
	comicComment.Comment = comment
	//
	//result, err := comicComment.Insert(comicComment.ComicID, comicComment.Comment)
	//if err != nil {
	//	return err
	//
	//}

	return JSON(w, http.StatusOK, comicComment)
}

