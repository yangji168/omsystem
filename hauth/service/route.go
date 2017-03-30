package service

import (
	"github.com/astaxie/beego"
	"github.com/yangji168/omsystem/hauth/controllers"
)

func registerRouter() {
	beego.Get("/", controllers.IndexPage)
}
