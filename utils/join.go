package utils

import "strings"

const (
	splitstr = "_join_"
)

func JoinCode(domain_id, code_number string) string {
	return domain_id + splitstr + code_number
}

// 判断编码是否由 domain id与code number 拼接而成.
func CheckSplit(str string) bool {
	return len(strings.Split(str, splitstr)) == 2
}

// 返回编码信息的Code number
func SplitCode(id string) string {
	tmp := strings.Split(id, splitstr)
	if len(tmp) == 2 {
		return tmp[1]
	} else {
		return id
	}
}

// 返回编码信息的domain id
func SplitDomain(id string) string {
	tmp := strings.Split(id, splitstr)
	if len(tmp) == 2 {
		return tmp[0]
	} else {
		return id
	}
}
