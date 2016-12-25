#nice可以调整自己创建的进程的优先级
nice -n num command	#创建command进程并给予优先级num

#常用选项
-n num			#用于指定新的优先级num

#注意
1.linux的优先级从-20（最高优先级）到+20（最低优先级）。默认情况下bash shell启动的进程的优先级都为0.
2.提高优先级是需要管理员权限.

#示例
nice -n 10 ls > output	#将ls*命令优先级降低到优先级10
