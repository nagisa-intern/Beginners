package base
import (
	"fmt"
	"io"
	"log"
	"net/http"
	"github.com/nagisa-intern/Beginners/db"
	"github.com/nagisa-intern/Beginners/controller"
	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"

)
// Serverはベースアプリケーションのserverを示します
type Server struct {
	dbx    *sqlx.DB
	router *mux.Router
}
func (s *Server) Close() error {
	return s.dbx.Close()
}
// InitはServerを初期化する
func (s *Server) Init(dbconf, env string) {
	cs, err := db.NewConfigsFromFile(dbconf)
	if err != nil {
		log.Fatalf("cannot open database configuration. exit. %s", err)
	}
	dbx, err := cs.Open(env)
	if err != nil {
		log.Fatalf("db initialization failed: %s", err)
	}
	s.dbx = dbx
	s.router = s.Route()
}
// Newはベースアプリケーションを初期化します
func New() *Server {
	return &Server{}
}
func (s *Server) Run(addr string) {
	log.Printf("start listening on %s", addr)
	http.ListenAndServe(addr, s.router)
}
// Routeはベースアプリケーションのroutingを設定します
func (s *Server) Route() *mux.Router {
	router := mux.NewRouter()

	comics := &controller.Comics{DB: s.dbx}

	router.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		io.WriteString(w, "pong")
	}).Methods("GET")
	router.HandleFunc("/dbping", func(w http.ResponseWriter, r *http.Request) {
		if err := s.dbx.PingContext(r.Context()); err != nil {
			w.WriteHeader(500)
			fmt.Fprintf(w, "db connection failed: %s", err)
		}
		w.WriteHeader(http.StatusOK)
		fmt.Fprint(w, "dbpong")
	}).Methods("GET")

	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "static/index.html")
	})




	router.Handle("/api/comics", handler(comics.GetAll)).Methods("GET")
	router.Handle("/api/comics/{color}", handler(comics.Get)).Methods("GET")


	router.PathPrefix("/css/").Handler(
		http.StripPrefix("/css/", http.FileServer(http.Dir("static/css"))))
	router.PathPrefix("/js/").Handler(
		http.StripPrefix("/js/", http.FileServer(http.Dir("static/js"))))
	return router
}