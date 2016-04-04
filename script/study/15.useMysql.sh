#!/bin/bash
#在脚本中使用mysql数据库
#首先我们可以使用which命令获取到mysql的位置
mysql=`which mysql`
#登陆mysql服务器

#$mysql -u root -p

#此时mysql会让我们填写登陆密码，为了不用每次都填写mysql密码。我们就将/etc/mysql/my.cnf（mysql的配置文件）中添加一下几行
#[client]
#password = Yang_303011
#
#这样就不需要再次登陆了，以后我们只需要使用以下语句即可登陆test数据库
$mysql 'test' -u root

#发送单个命令并退出：
$mysql 'test' -u root -e 'select * from test'

#发送多个命令
$mysql 'test' -u root <<EOF
show tables;
select * from test;
EOF
