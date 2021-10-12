#用于管理终端的信息
tput 选项

#常用选项
cols			#获取列数
lines			#获取行数
longname		#获取终端名
cup 数字 数字		#将光标移动到指定位置
setb 数字		#设置终端背景,数字范围为0-7
setf 数字		#设置终端文本前景色,数字范围为0-7
bold			#设置文本样式为粗体

#示例
tput cols
tput lines
tput cup 2 3
tput setb 3
