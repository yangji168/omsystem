package controllers

import (
	"github.com/astaxie/beego/context"
	"github.com/yangji168/omsystem/hauth/hcache"
	"github.com/yangji168/omsystem/utils/hret"
)

func IndexPage(ctx *context.Context) {
	rst, err := hcache.GetStaticFile("AsofdateIndexPage")
	if err != nil {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 404, "页面不存在")
		return
	}
	ctx.ResponseWriter.Write(rst)
}

func init() {
	hcache.Register("AsofdateIndexPage", "./views/login.tpl")
}
