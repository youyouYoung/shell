#用于显示用户登录系统的信息
语法:last 选项 参数 用户名

#常用选项
-a		#显示登录系统的主机名或ip
-d		#将ip转化为主机名称
-f 记录文件	#指定记录文件
-n 数字/-数字	#指定记录的行数
-R		#不显示登录系统的主机名或ip地址
-x		#显示系统关机,重启等信息
-F		#显示完整登录登出时间

#注意
1.last为指定记录文件时,默认显示/var/log/wtmp中内容

#示例
last -6
last -n 15 -f /var/log/btmp
last -5 youyou		#显示特定用户的登录情况
last -5 youyou -x	#显示登录登出信息
last -R
last -a
