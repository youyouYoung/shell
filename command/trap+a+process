#trap用于监控某种信号的发生,并做出相应的触发指令.
trap 触发指令 监控信号列表

#常用选项

#示例
trap 'echo "hah"' ABRT		#在接收到ABRT信号时,执行echo "hah"操作.
trap '-' ABRT			#在触发指令为-的情况下,表示恢复ABRT原本的作用
trap '' ABRT			#忽略系统发出的ABRT信号
trap echo "this is my response, when you use ctrl+c" SIGINT SIGTERM
