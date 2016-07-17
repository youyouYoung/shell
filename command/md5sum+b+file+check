#用于生成或校验文件的校验和
语法:md5sum 选项 文件列表

#常用选项
-c 保存校验码的文件	#用于校验文件中指定的文件的正确性

#注意
1.校验和是根据文件内容求出来的,所以通过校验和可判断任意两个文件(可能不同文件名)是否内容相同.

#示例
md5sum file >file1	#生成file文件的校验码
md5sum -c file1		#校验file文件的正确性
find . -type f -print0 | xargs -0 md5sum >> demo.md5
