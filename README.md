## 项目简介
以beego为基础的一款快速开发平台，集成了菜单管理、用户管理、角色管理、授权管理、日志管理、机构管理、路由管理、域定义管理等等。


## 特点介绍

1. 去session化，采用jwt标准管理用户连接信息，易于分布式环境部署.
2. 菜单页面采用metro风格,简洁明了.
3. 权限控制到按钮级别，有效的对系统API服务进行控制.
4. 快速添加应用程序，只需要在菜单资源管理页面中注册新应用的菜单、路由信息，便可便捷的扩展新应用.
5. 用户操作记录十分精细，有效的记录用户每一个API请求.


## 安装方法

**1. 导入数据库信息**

导入mysql数据文件

echo "create database omsystem charset='utf8';" | mysql -uroot -p

mysql -uroot -p omsystem < omsystem/dbobj/scripts/omsystem.sql


** build编译 **



** 修改配置文件**

conf/system.proerties


## 启动

nohup ./omsystem &


打开浏览器,访问:http://localhost:8080


管理员用户: admin, 密码: omsystem