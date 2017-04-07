package validator

import (
	"net/url"
	"strings"
	"time"
)

// IsNull check if the string is null.
func IsNull(str string) bool {
	return len(str) == 0
}

func IsWord(str string, params ...int) bool {
	if IsNull(str) {
		return false
	}
	return rxWord.MatchString(str)
}

func IsTime(str string, format string) bool {
	_, err := time.Parse(format, str)
	return err == nil
}

func IsDate(str string, format ...string) bool {

	if len(format) == 0 {

		if len(strings.Split(str, "/")) > 1 {
			return IsTime(str, "2006/01/02")
		}

		if len(strings.Split(str, "-")) > 1 {
			return IsTime(str, "2006-01-02")
		}

		return false
	}

	return IsTime(str, format[0])
}

func IsEmpty(str string) bool {
	return len(strings.TrimSpace(str)) == 0
}

func IsRequestURI(rawurl string) bool {
	_, err := url.ParseRequestURI(rawurl)
	return err == nil
}

func IsURI(str string) bool {
	relation := false

	for idx, val := range str {
		if val == '.' {
			relation = true
			continue
		}
		if val == '/' || val == '\\' {
			if idx < len(str)-1 {
				relation = true
				continue
			}
		}

		if relation && (val != '/' && val != '\\') {
			return false
		}
		return IsRequestURI(str[idx:])
	}
	return false
}
