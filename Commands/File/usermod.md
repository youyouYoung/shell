#用于修改用户的账户信息
语法:usermod 选项 用户名

#常用选项
-c 备注		#设置账户的备注信息
-d 目录路径	#修改用户的登录目录
-e 时间		#设置账户的过期时间
-f 天数		#设置在密码过期几天后关闭该账户
-g 群组		#修改用户所属组
-G 群组		#修改用户所属的附加组
-l 名称		#修改用户的账户名称
-L		#锁定用户密码
-m 路径		#移动用户主目录
-o		#允许用户id不必唯一
-p 密码		#修改密码
-s shell	#修改登录shell
-u id		#修改用户的uid
-U		#解除密码锁定

#注意
1.usermod命令不允许你改变正在线上的使用者帐号名称.

#示例
usermod -G staff newuser2 
usermod -l newuser1 newuser 
usermod -L newuser1 
usermod -U newuser1
usermod -e 01/01/2013 test
usermod -G staff newuser2
