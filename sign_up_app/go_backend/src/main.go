package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	// "github.com/edgedb/edgedb-go"
	"github.com/gorilla/mux"
)

type Users struct {
	Id        int    `json:"id"`
	FirstName string `json:"first_name"`
	LastName  string `json:"last_name"`
	Email     string `json:"email" binding:"required" gorm:"unique"`
	Phone     string `json:"phone" binding:"required" gorm:"unique"`
	DOB       string `json:"dob"`
}

var users []Users

func allUsers() {
	user := Users{
		Id:        1,
		FirstName: "Abhishek",
		LastName:  "Bhatia",
		Email:     "abhibhatia2000@gmail.com",
		Phone:     "9654422129",
		DOB:       "08-07-2000",
	}
	users = append(users, user)
	fmt.Println(users)
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("I am Home Page")
}

func getUsers(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(users)
}

func handleRoutes() {
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/get_users", getUsers).Methods("GET")
	// router.HandleFunc("/addUser", addUser).Methods("POST")
	log.Fatal(http.ListenAndServe(":8080", router))
}

func main() {
	allUsers()
	handleRoutes()
}
