// this package provide method which handle domain share action
package controllers

import (
	"html/template"
	"strings"

	"github.com/asaskevich/govalidator"
	"github.com/astaxie/beego/context"
	"github.com/yangji168/omsystem/hauth/hrpc"
	"github.com/yangji168/omsystem/hauth/models"
	"github.com/yangji168/omsystem/utils/hret"
	"github.com/yangji168/omsystem/utils/i18n"
	"github.com/yangji168/omsystem/utils/logs"
	"github.com/yangji168/omsystem/utils/token/hjwt"
	"github.com/yangji168/omsystem/utils/validator"
)

type domainShareControll struct {
	models *models.DomainShareModel
}

var DomainShareCtl = domainShareControll{
	models: new(models.DomainShareModel),
}

// domain share configuration page
// in this page, you can config share the domain to others.
func (domainShareControll) Page(ctx *context.Context) {
	defer hret.HttpPanic()
	ctx.Request.ParseForm()

	if !hrpc.BasicAuth(ctx) {
		return
	}

	// check the domain details
	// config this domain to others
	var domain_id = ctx.Request.FormValue("domain_id")

	if !hrpc.CheckDomain(ctx, domain_id, "r") {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 420, i18n.Get("as_of_date_domain_permission_denied"))
		return
	}

	// get the domain details info
	rst, err := DomainCtl.models.GetRow(domain_id)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 419, i18n.Get("as_of_date_domain_get_info_failed"), err)
		return
	}

	hz, _ := template.ParseFiles("./views/hauth/domain_share_info.tpl")
	hz.Execute(ctx.ResponseWriter, rst)
}

// 查询域共享信息
func (this domainShareControll) Get(ctx *context.Context) {
	defer hret.HttpPanic()

	if !hrpc.BasicAuth(ctx) {
		return
	}

	domain_id := ctx.Request.FormValue("domain_id")

	// if the request argument domain_id is empty,
	// so set domain_id yourself.
	if strings.TrimSpace(domain_id) == "" {
		cookie, _ := ctx.Request.Cookie("Authorization")
		jclaim, err := hjwt.ParseJwt(cookie.Value)
		if err != nil {
			logs.Error(err)
			hret.WriteHttpErrMsgs(ctx.ResponseWriter, 403, i18n.Disconnect())
			return
		}
		domain_id = jclaim.Domain_id
	}

	if !hrpc.CheckDomain(ctx, domain_id, "r") {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 403, i18n.Get("as_of_date_domain_permission_denied"))
		return
	}

	// get domain_id share info
	rst, err := this.models.Get(domain_id)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 419, i18n.Get("as_of_date_domain_get_info_failed"), err)
		return
	}
	hret.WriteJson(ctx.ResponseWriter, rst)
}

// check unshare domains to the domain
func (this domainShareControll) UnAuth(ctx *context.Context) {
	ctx.Request.ParseForm()
	domain_id := ctx.Request.FormValue("domain_id")
	if strings.TrimSpace(domain_id) == "" {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 419, i18n.Get("as_of_date_domain_isempty"))
		return
	}
	rst, err := this.models.UnAuth(domain_id)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 419, i18n.Get("as_of_date_check_unshare"))
		return
	}
	hret.WriteJson(ctx.ResponseWriter, rst)
}

// 新增域共享信息
func (this domainShareControll) Post(ctx *context.Context) {
	ctx.Request.ParseForm()

	if !hrpc.BasicAuth(ctx) {
		return
	}

	domain_id := ctx.Request.FormValue("domain_id")
	target_domain_id := ctx.Request.FormValue("target_domain_id")
	auth_level := ctx.Request.FormValue("auth_level")

	if !hrpc.CheckDomain(ctx, domain_id, "w") {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 420, i18n.Get("as_of_date_domain_permission_denied_modify"))
		return
	}

	if !validator.IsWord(target_domain_id) {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 421, i18n.Get("as_of_date_domain_target"))
		return
	}

	if !govalidator.IsIn(auth_level, "1", "2") {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 421, i18n.Get("as_of_date_domain_mode"))
		return
	}

	cookie, _ := ctx.Request.Cookie("Authorization")
	jclaim, err := hjwt.ParseJwt(cookie.Value)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 421, i18n.Disconnect())
		return
	}

	err = this.models.Post(domain_id, target_domain_id, auth_level, jclaim.User_id)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 419, i18n.Get("as_of_date_domain_share_failed"))
		return
	} else {
		hret.WriteHttpOkMsgs(ctx.ResponseWriter, i18n.Get("success"))
	}
}

// 删除域共享信息
func (this domainShareControll) Delete(ctx *context.Context) {
	ctx.Request.ParseForm()

	if !hrpc.BasicAuth(ctx) {
		return
	}

	js := ctx.Request.FormValue("JSON")
	domain_id := ctx.Request.FormValue("domain_id")

	if !validator.IsWord(domain_id) {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 421, i18n.Get("as_of_date_domain_id_check"))
		return
	}

	if !hrpc.CheckDomain(ctx, domain_id, "w") {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 420, i18n.Get("as_of_date_domain_permission_denied_modify"))
		return
	}

	// delete share domain info
	err := this.models.Delete(js, domain_id)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 419, i18n.Get("as_of_date_domain_share_delete"), err)
		return
	}

	hret.WriteHttpOkMsgs(ctx.ResponseWriter, i18n.Get("success"))
}

// 更新域共享信息
func (this domainShareControll) Put(ctx *context.Context) {
	ctx.Request.ParseForm()

	if !hrpc.BasicAuth(ctx) {
		return
	}

	uuid := ctx.Request.FormValue("uuid")
	level := ctx.Request.FormValue("auth_level")
	domain_id := ctx.Request.FormValue("domain_id")

	if !hrpc.CheckDomain(ctx, domain_id, "w") {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 420, i18n.Get("as_of_date_domain_permission_denied_modify"))
		return
	}

	if !validator.IsWord(domain_id) {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 421, i18n.Get("as_of_date_domain_target"))
		return
	}

	if !govalidator.IsIn(level, "1", "2") {
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 421, i18n.Get("as_of_date_domain_mode"))
		return
	}

	// get user session from cookies
	cookie, _ := ctx.Request.Cookie("Authorization")
	jclaim, err := hjwt.ParseJwt(cookie.Value)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 421, i18n.Disconnect())
		return
	}

	err = this.models.Update(uuid, jclaim.User_id, level)
	if err != nil {
		logs.Error(err)
		hret.WriteHttpErrMsgs(ctx.ResponseWriter, 419, i18n.Get("as_of_date_domain_share_update"))
		return
	} else {
		hret.WriteHttpOkMsgs(ctx.ResponseWriter, i18n.Get("success"))
	}
}
