#执行参数提供的命令,并使用该命令产生的进程替换当前调用exec的进程
语法:exec 命令列表

#注意
1.exec并不启动新的shell，而是用要被执行命令替换当前的shell进程,脚本中exec命令后的其它命令将不再执行.
2.一般将exec命令放到一个shell脚本里面，用主脚本调用这个脚本.
3.当exec命令来对文件描述符操作的时候，就不会替换调用的shell进程.

#示例
exec command	#执行command命令,取代目前的shell.当前shell会自动关闭.
exec < data	#使转向操作生效.表示凡是由标准输入读取数据的,都改从data中读取
