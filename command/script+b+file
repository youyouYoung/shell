#用于生成一个脚本使用日志,将命令产生的信息记录下来.
语法:script 选项 日志文件

#常用选项
-q			#使script以静默模式运行
-a			#将此次记录内容追加到文件末尾
-t			#将时序数据导入stderr
-f

#注意
1.如果要使用scriptreplay回放命令的执行过程,需要保存时序文件.

#示例
script file.log		#创建一个file.log文件记录将要执行的命令
script -t 2>test.log test #保存时序文件
