package models

import (
	"github.com/yangji168/omsystem/dbobj"
)

type ThemeModel struct {
}

func (ThemeModel) Post(user_id, theme_id string) error {
	return dbobj.Exec(sys_rdbms_024, theme_id, user_id)
}
