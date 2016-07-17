#renice可以修改目前系统中的任意进程的优先级
renice num -p PID	#将进程号为pid的进程优先级改为num

#常用选项
-p PID			#指定要修改的进程号

#注意
1.只能对属于自己的进程执行renice命令
2.只能通过renice降低进程的优先级
3.root用户可以通过renice调整任何进程的优先级到任何程度

#示例
renice 10 -p 29381	#将29381进程优先级改为10
