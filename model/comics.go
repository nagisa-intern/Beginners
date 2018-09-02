package model

import (
"github.com/jmoiron/sqlx"
	"database/sql"
)

type Comic struct {
	ID           int64  `json:"id"`
	Title        string `json:"title"`
	Summary      string `json:"summary`
	Color		 string	`db:"thumb_color" json:"color"`
}

type Author struct {
	ID        int64  `json:"id"`
	Name      string `json:"name"`
	Info      string    `json:"info"`
}

type ComicData struct {
	ID		int64	`json:"id"`
	ComicID int64	`db:"comic_id" json:"comic_id"`
	Title	string	`json:"title"`
	Episode	int64	`json:"episode"`
	Page	int64	`json:"page"`
}

type ComicComment struct {
	ID	int64 `json:"id"`
	ComicID int64 `db:"comic_id" json:"comic_id"`
	Comment string `json:"comment"`
}

func ComicsAll(dbx *sqlx.DB) (comics []Comic, err error) {
	if err := dbx.Select(&comics, `select * from comics`); err != nil {
		return nil, err
	}
	return comics, nil
}

func ComicOne(dbx *sqlx.DB, color string) (comics []Comic, err error) {
	if err := dbx.Select(&comics, `select * from comics where thumb_color = ?`, color); err != nil {
		return nil, err
	}
	return comics, nil
}


func AuthorOne(dbx *sqlx.DB, id int64) (author []Author, err error) {
	if err := dbx.Select(&author, `select * from authors where id = ?`, id); err != nil {
		return nil, err
	}
	return author, nil
}

func (c *ComicComment) Insert(tx *sqlx.Tx) (sql.Result, error) {
	stmt, err := tx.Prepare(`insert into comic_comment (comic_id, comment) values(?, ?)`)
	if err != nil {
		return nil, err
	}
	defer stmt.Close()
	return stmt.Exec(c.ComicID, c.Comment)
}

//func (a *Article) Insert(tx *sqlx.Tx) (sql.Result, error) {
//	stmt, err := tx.Prepare(`insert into articles (title, user_id) values(?, ?)`)
//	if err != nil {
//		return nil, err
//	}
//	defer stmt.Close()
//	return stmt.Exec(a.Title, a.UserId)
//}
//
//func (a *Article) Delete(tx *sqlx.Tx) (sql.Result, error) {
//	stmt_card, err := tx.Prepare(`delete from cards where article_id = ?`)
//	if err != nil {
//		return nil, err
//	}
//	defer stmt_card.Close()
//
//	stmt_article, err := tx.Prepare(`delete from articles where id = ?`)
//	if err != nil {
//		return nil, err
//	}
//	defer stmt_article.Close()
//
//	if _, err = stmt_card.Exec(a.ID); err != nil {
//		return nil, err
//	}
//	if _, err = stmt_article.Exec(a.ID); err != nil {
//		return nil, err
//	}
//	return nil, nil
//}
//
//func (a *Article) Update(tx *sqlx.Tx) (sql.Result, error) {
//	stmt, err := tx.Prepare(`update articles set thumbnail_url = ?, status = ? where id = ?`)
//	if err != nil {
//		return nil, err
//	}
//	defer stmt.Close()
//	return stmt.Exec(a.ThumbnailUrl, a.Status, a.ID)
//}
//
//func (a *Article) UpdateTitle(tx *sqlx.Tx) (sql.Result, error) {
//	stmt, err := tx.Prepare(`update articles set title = ? where id = ?`)
//	if err != nil {
//		return nil, err
//	}
//	defer stmt.Close()
//	return stmt.Exec(a.Title, a.ID)
//}
//
//// sqlxを使うと存在判定ができない. (controllerから直接call)
//func ExistArticleSet(db *sqlx.DB, target_id int, user_id int) (bool, error) {
//	var id int64
//	if err := db.DB.QueryRow("select id from articles where id = ? and user_id = ?", target_id, user_id).Scan(&id); err != nil {
//		return false, nil
//	}
//	return true, nil
//}
