package main

import (
	"github.com/astaxie/beego"
	_ "github.com/yangji168/omsystem/apps"
	"github.com/yangji168/omsystem/hauth/service"
)

func main() {
	service.StartHauth()
	beego.Run()
}
