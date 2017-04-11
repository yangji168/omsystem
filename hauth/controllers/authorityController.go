package controllers

import (
	"github.com/astaxie/beego/context"
	"github.com/yangji168/omsystem/hauth/hcache"
	"github.com/yangji168/omsystem/hauth/hrpc"
	"github.com/yangji168/omsystem/hauth/models"
	"github.com/yangji168/omsystem/utils/hret"
	"github.com/yangji168/omsystem/utils/i18n"
)

// Controller
// for authorization
// this class provide 4 Method
type AuthorityController struct {
	models *models.AuthorityModel
}

var AuthroityCtl = &AuthorityController{
	models: new(models.AuthorityModel),
}

// Get authorization page
func (this *AuthorityController) GetBatchPage(ctx *context.Context) {
	if !hrpc.BasicAuth(ctx) {
		return
	}

	rst, err := hcache.GetStaticFile("AuthorityPage")
	if err != nil {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 404, i18n.Get("as_of_date_page_not_exist"))
		return
	}

	ctx.ResponseWriter.Write(rst)
}

func init() {
	hcache.Register("AuthorityPage", "./views/hauth/sys_batch_page.tpl")
}
