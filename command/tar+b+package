#用于将文件打包并保留原有的目录结构和文件权限
语法:tar 选项 文件

#常用选项
-c			#创建tar文件
-t			#列出tar文件内容
-x			#解包tar文件内容
-r			#向已打包文件末尾追加文件
#以上选项不能同时出现
-j			#使用bz2属性(tar.bz2)处理文件
-v			#显示详细过程
-z			#使用gzip属性(tar.gz)处理文件
-f 打包文件名		#指定tar文件名
-C			#将解包结果放在指定目录下

#示例
tar -xvzf pack.tgz -C /home	#将tar文件解包到/home下
tar -cvzf pack.tgz /home	#将/home目录下的文件打包成pack.tgz文件
tar -tvzf pack.tgz		#显示pack.tgz中内容
tar -xvzf pack.tgz		#将包解压到当前位置
tar -rf all.tar *.gif 
tar -tf all.tar 
