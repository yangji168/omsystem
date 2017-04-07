package controllers

import (
	"io/ioutil"
	"net/http"

	"github.com/astaxie/beego/context"
	"github.com/yangji168/omsystem/hauth/models"
	"github.com/yangji168/omsystem/utils/hret"
	"github.com/yangji168/omsystem/utils/logs"
	"github.com/yangji168/omsystem/utils/token/hjwt"
)

var homePageMenusModel = new(models.HomePageMenusModel)

func HomePageMenus(ctx *context.Context) {
	defer hret.HttpPanic()

	typeId := ctx.Request.FormValue("TypeId")
	Id := ctx.Request.FormValue("Id")

	cookie, _ := ctx.Request.Cookie("Authorization")
	jclaim, err := hjwt.ParseJwt(cookie.Value)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 403, "No Auth")
		return
	}

	ojs, err := homePageMenusModel.Get(Id, typeId, jclaim.User_id)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, http.StatusExpectationFailed, "please contact sysadmin.query main menu failed.")
		return
	}
	ctx.ResponseWriter.Write(ojs)
}

func SubSystemEntry(ctx *context.Context) {
	defer hret.HttpPanic()

	ctx.Request.ParseForm()
	id := ctx.Request.FormValue("Id")
	cookie, _ := ctx.Request.Cookie("Authorization")
	jclaim, err := hjwt.ParseJwt(cookie.Value)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 403, "No Auth")
		return
	}

	url := homePageMenusModel.GetUrl(jclaim.User_id, id)
	hz, _ := ioutil.ReadFile(url)
	ctx.ResponseWriter.Write(hz)
}
