package service

import (
	"github.com/astaxie/beego"
	"github.com/yangji168/omsystem/hauth/controllers"
)

func registerRouter() {
	beego.Get("/", controllers.IndexPage)
	beego.Get("/HomePage", controllers.HomePage)
	beego.Post("/login", controllers.LoginSystem)
	beego.Any("/logout", controllers.LogoutSystem)

	beego.Get("/v1/auth/main/menu", controllers.HomePageMenus)
	beego.Get("/v1/auth/index/entry", controllers.SubSystemEntry)
	beego.Post("/v1/auth/passwd/update", controllers.PasswdController.PostModifyPasswd)

	// domain_info
	beego.Get("/v1/auth/domain/share/page", controllers.DomainShareCtl.Page)
	beego.Get("/v1/auth/domain/get", controllers.DomainCtl.GetDomainInfo)
	beego.Post("/v1/auth/domain/post", controllers.DomainCtl.PostDomainInfo)
	beego.Post("/v1/auth/domain/delete", controllers.DomainCtl.DeleteDomainInfo)
	beego.Put("/v1/auth/domain/update", controllers.DomainCtl.UpdateDomainInfo)

	//domain_share_info
	beego.Get("/v1/auth/domain/share/get", controllers.DomainShareCtl.Get)
	beego.Post("/v1/auth/domain/share/post", controllers.DomainShareCtl.Post)
	beego.Put("/v1/auth/domain/share/put", controllers.DomainShareCtl.Put)
	beego.Post("/v1/auth/domain/share/delete", controllers.DomainShareCtl.Delete)
	beego.Get("/v1/auth/domain/owner", controllers.DomainCtl.GetDomainOwner)
	beego.Get("/v1/auth/domain/self/owner", controllers.DomainCtl.GetOwner)
	beego.Get("/v1/auth/domain/row/details", controllers.DomainCtl.GetDetails)
	beego.Get("/v1/auth/domain/share/unauth", controllers.DomainShareCtl.UnAuth)

	//handle_logs
	beego.Get("/v1/auth/handle/logs/search", controllers.HandleLogsCtl.SerachLogs)
	beego.Get("/v1/auth/handle/logs", controllers.HandleLogsCtl.GetHandleLogs)
	beego.Get("/v1/auth/handle/logs/download", controllers.HandleLogsCtl.Download)

	//org_info
	beego.Get("/v1/auth/resource/org/get", controllers.OrgCtl.GetSysOrgInfo)
	beego.Post("/v1/auth/resource/org/insert", controllers.OrgCtl.InsertOrgInfo)
	beego.Put("/v1/auth/resource/org/update", controllers.OrgCtl.UpdateOrgInfo)
	beego.Post("/v1/auth/resource/org/delete", controllers.OrgCtl.DeleteOrgInfo)
	beego.Get("/v1/auth/resource/org/download", controllers.OrgCtl.Download)
	beego.Get("/v1/auth/relation/domain/org", controllers.OrgCtl.GetSubOrgInfo)
	beego.Get("/v1/auth/domain/id", controllers.DomainCtl.GetDomainId)

	//resource_info
	beego.Post("/v1/auth/resource/delete", controllers.ResourceCtl.Delete)
	beego.Post("/v1/auth/resource/post", controllers.ResourceCtl.Post)
	beego.Put("/v1/auth/resource/update", controllers.ResourceCtl.Update)
	beego.Get("/v1/auth/resource/get", controllers.ResourceCtl.Get)
	beego.Get("/v1/auth/resource/queryTheme", controllers.ResourceCtl.QueryTheme)
	beego.Put("/v1/auth/resource/config/theme", controllers.ResourceCtl.ConfigTheme)
	beego.Get("/v1/auth/resource/query", controllers.ResourceCtl.Query)

	//role_resource_info
	beego.Get("/v1/auth/role/resource/get", controllers.RoleAndResourceCtl.GetResource)
	beego.Post("/v1/auth/role/resource/rights", controllers.RoleAndResourceCtl.HandleResource)

	//role_info
	beego.Get("/v1/auth/role/get", controllers.RoleCtl.Get)
	beego.Post("/v1/auth/role/post", controllers.RoleCtl.Post)
	beego.Put("/v1/auth/role/update", controllers.RoleCtl.Update)
	beego.Post("/v1/auth/role/delete", controllers.RoleCtl.Delete)

	// role and resource relation
	beego.Get("/v1/auth/role/resource/details", controllers.RoleAndResourceCtl.ResourcePage)

	//sys_batch_info
	beego.Get("/v1/auth/user/roles/get", controllers.UserRolesController.GetRolesByUserId)
	beego.Get("/v1/auth/user/search", controllers.UserCtl.Search)
	beego.Get("/v1/auth/user/roles/other", controllers.UserRolesController.GetOtherRoles)
	beego.Post("/v1/auth/user/roles/auth", controllers.UserRolesController.Auth)
	beego.Post("/v1/auth/user/roles/revoke", controllers.UserRolesController.Revoke)

	//user_info
	beego.Get("/v1/auth/user/get", controllers.UserCtl.Get)
	beego.Post("/v1/auth/user/post", controllers.UserCtl.Post)
	beego.Put("/v1/auth/user/put", controllers.UserCtl.Put)
	beego.Put("/v1/auth/user/modify/passwd", controllers.UserCtl.ModifyPasswd)
	beego.Put("/v1/auth/user/modify/status", controllers.UserCtl.ModifyStatus)
	beego.Post("/v1/auth/user/delete", controllers.UserCtl.Delete)
	beego.Get("/v1/auth/user/query", controllers.UserCtl.GetUserDetails)

	// help
	beego.Get("/v1/help/system/help", controllers.HelpCtl.Page)

	beego.Get("/v1/auth/HandleLogsPage", controllers.HandleLogsCtl.GetHandleLogPage)
	beego.Get("/v1/auth/domain/page", controllers.DomainCtl.GetDomainInfoPage)
	beego.Get("/v1/auth/batch/page", controllers.AuthroityCtl.GetBatchPage)
	beego.Get("/v1/auth/resource/org/page", controllers.OrgCtl.GetOrgPage)
	beego.Get("/v1/auth/resource/page", controllers.ResourceCtl.Page)
	beego.Get("/v1/auth/user/page", controllers.UserCtl.Page)
	beego.Get("/v1/auth/role/page", controllers.RoleCtl.Page)
}
