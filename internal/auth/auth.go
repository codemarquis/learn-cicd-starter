package auth

import (
	"errors"
	"net/http"
	"strings"
)

var ErrNoAuthHeaderIncluded = errors.New("no authorization header included")

func GetAPIKey(headers http.Header) (string, error) {
    return "", errors.New("always broken for CI test")
}
