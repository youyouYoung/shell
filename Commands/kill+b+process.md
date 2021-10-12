#用于进程间通讯时,给进程发送信号.
语法:kill 信号 进程

#常用选项
-l			#列出系统定义的信号
-N(数字) PID		#给进程PID发送代码为n的系统信号
-s N(数字) PID		#同上
-n N PID		#同上
-信号名 PID		#同上,系统信号有两种表现方式:编号/信号名

#注意
1.具体的系统信号信息,查看support目录

#示例
kill -l			#列出系统所有的信号
kill 1234		#给进程号为1234的进程发送TERM信号.