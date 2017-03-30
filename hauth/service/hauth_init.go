package service

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
)

func StartHauth() {
	// 转发80端口的请求到443
	go RedictToHttps()

	beego.InsertFilter("/*", beego.FinishRouter, func(ctx *context.Context) {
		go WriteHandleLogs(ctx)
	}, false)

	beego.InsertFilter("/v1/*", beego.BeforeRouter, func(ctx *context.Context) {
		CheckJWT(ctx)
	}, false)

	registerRouter()
}
