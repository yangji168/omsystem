package controllers

import (
	"github.com/astaxie/beego/context"
	"github.com/yangji168/omsystem/hauth/hcache"
	"github.com/yangji168/omsystem/hauth/models"
	"github.com/yangji168/omsystem/utils/hret"
)

type AuthorityController struct {
	models *models.AuthorityModel
}

var AuthroityCtl = &AuthorityController{
	models: new(models.AuthorityModel),
}

// Get authorization page
func (this *AuthorityController) GetBatchPage(ctx *context.Context) {
	if !models.BasicAuth(ctx) {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 403, "权限不足")
		return
	}

	rst, err := hcache.GetStaticFile("AuthorityPage")
	if err != nil {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 404, "页面不存在")
		return
	}

	ctx.ResponseWriter.Write(rst)
}

func init() {
	hcache.Register("AuthorityPage", "./views/hauth/sys_batch_page.tpl")
}
