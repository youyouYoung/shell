#用于从标准输入读取数据
语法:read 选项 变量列表


#常用选项
-a		#将var视为数组,将输入保存在其中
-r		#read在读入时不要滤掉转义字符(\n等,不使用\n会剩下n)
-p 提示语句	#在输入前,向屏幕输出提示语句
-n 数字		#设置命令读入的字符数
-t 数字		#设置read命令等待输入的秒数,过时间后退出read命令
-s		#使输入的数据不显示在监视器上

#注意
1.在使用read前可以先通过改变IFS的值,来规定输入的数据之间的分隔符.
2.要从输入中读取多个数据时,在变量列表处写上保存数据的变量名,用空格分开.
3.当达到-n选项要求的数量时,不需要收到换行符就直接退出read操作.
4.在输入之前设置IFS变量的值,用于规定输入数据的分隔符,根据分隔符read指令会判断输入数据有几个.例如
数据:		'asc s\tad\n sadf\tasd qwe'
有2个数据	'asc sad','sadf\tasd qwe'		IFS=\n
有3个数据	'asc s','ad\n sadf','asd qwe'		IFS=\t
有4个数据	'asc','s\tad\n','sadf\tasd','qwe'	IFS=' '

#示例
read line1 line2			#将读入保存在line1,line2变量中
read -a arr << (echo 103 23 23 34 54)	#将数据保存在arr数组中
read -r var < file			#将file内容读入并不忽略转义
IFS=' ';read string < file		#以空格作为分隔符,可以避免读入时以\n,\t作为结束符而没有读入.这样可以保证原文件的排版.
