package main

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"mime/multipart"
	"net/http"
	"os"
	"time"

	"cloud.google.com/go/storage"
	"github.com/gin-gonic/gin"

	// "github.com/edgedb/edgedb-go"
	"github.com/gorilla/mux"
)

const (
	projectID  = "neon-dryad-385413" // FILL IN WITH YOURS
	bucketName = "user_data007"      // FILL IN WITH YOURS
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

func homePage(_ http.ResponseWriter, _ *http.Request) {
	fmt.Println("I am Home Page")
}

func getUsers(w http.ResponseWriter, _ *http.Request) {
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

type ClientUploader struct {
	cl         *storage.Client
	projectID  string
	bucketName string
	uploadPath string
}

var uploader *ClientUploader

func init() {
	os.Setenv("GOOGLE_APPLICATION_CREDENTIALS", "/Users/abhishek/Documents/flutter/the_quiz_app/neon-dryad-385413-f12ae82e2680.json") // FILL IN WITH YOUR FILE PATH
	client, err := storage.NewClient(context.Background())
	if err != nil {
		log.Fatalf("Failed to create client: %v", err)
	}

	uploader = &ClientUploader{
		cl:         client,
		bucketName: bucketName,
		projectID:  projectID,
		uploadPath: "user_data007/test_data/",
	}

}
func upload() {
	//uploader.UploadFile("notes_test/abc.txt")
	r := gin.Default()
	r.POST("/upload", func(c *gin.Context) {
		f, err := c.FormFile("file_input")
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"error": err.Error(),
			})
			return
		}

		blobFile, err := f.Open()
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"error": err.Error(),
			})
			return
		}

		err = uploader.UploadFile(blobFile, f.Filename)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"error": err.Error(),
			})
			return
		}

		c.JSON(200, gin.H{
			"message": "success",
		})
	})

	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}

// UploadFile uploads an object
func (c *ClientUploader) UploadFile(file multipart.File, object string) error {
	ctx := context.Background()
	ctx, cancel := context.WithTimeout(ctx, time.Second*50)
	defer cancel()
	// Upload an object with storage.Writer.
	wc := c.cl.Bucket(c.bucketName).Object(c.uploadPath + object).NewWriter(ctx)
	if _, err := io.Copy(wc, file); err != nil {
		return fmt.Errorf("io.Copy: %v", err)
	}
	if err := wc.Close(); err != nil {
		return fmt.Errorf("Writer.Close: %v", err)
	}

	return nil
}

func main() {
	upload()
	// allUsers()
	// handleRoutes()
}
