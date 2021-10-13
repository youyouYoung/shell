#file可以获取指定文件的类型信息
语法:file 文件

#常用选项
-b			#结果不显示文件名称
-L			#直接显示链接文件所指向文件的类型
-z			#尝试解读压缩文件的内容

#注意
1.linux中的文件类型
符号			描述			标识
 -			一般文件		text
 d			目录			directory
 l			符号链接文件		link
 b			磁盘设备文件		block
 c			字符设备文件		character
 s			socket文件		socket
 p			连接文件		FIFO（管道）
2.查看文件信息，包含32-bit就是32位，包含64-bit就是64位

#示例
file /home/youyou/		#将返回是一个目录
file /sbin/init
file 文件名			#察看文件编码
