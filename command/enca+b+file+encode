#用于查看或者改变文件编码
enca 选项 文件

#常用选项
-L		#常看文件编码
-x 编码格式	#改变编码格式

#注意
1.enca还有一个好处就是如果文件本来就是你要转换的那种编码，它不会报错，还是会print出结果来， 而”iconv”则会报错

#示例
enca file
enca -L zh_CN file			
enca -L zh_CN -x UTF-8 file		#将文件编码转换为”UTF-8″编码
enca -L zh_CN -x UTF-8 < file1 > file2	#如果不想覆盖原文件可以这样
