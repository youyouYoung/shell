#用于设置用户密码相关信息,密码以及密码过期时间等.
语法:passwd 选项 用户名

#常用参数
-k		#保留,用户在过期之后仍能使用
-l		#锁定,用户无权更改密码
-u		#解锁,解除锁定密码权限
-f		#强制操作
-S		#查询用户密码状态
-d		#删除密码
-g		#修改组密码

#注意
1.用于存放用户信息的文件:/etc/passwd,/etc/shadow
2.存放组信息的文件:/etc/group,/etc/gshadow

#示例
passwd -l beinan
passwd -d beinan
