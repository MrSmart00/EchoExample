package main

import (
	"github.com/labstack/echo"
	"net/http"
)

func main() {
	e := echo.New()
	e.GET("/ping", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World! via Echo.")
	})
	e.Logger.Fatal(e.Start(":1323"))
}
