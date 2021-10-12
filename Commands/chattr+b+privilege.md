#chattr用来改变ext2,ext3文件系统下的一组特殊文件属性
语法:
chattr +属性代码 文件	#给文件加上某种属性
chattr -属性代码 文件	#给文件减去某种属性
chattr =属性代码 文件	#设置文件属性为指定属性

#常用选项
代码	属性作用
A	文件的取用时间不改变
a	只能向文件中追加数据,不能删除.如果是目录,只能建立或修改文件不能删除
c	该文件将以压缩的形态存储在磁盘中,读取时会自动解压.
D	检查压缩文件中的错误
d	不能使用dump备份该文件,dump备份时会忽略该文件
i	不允许对文件做任何修改(修改删除等),如果是目录,只能修改目录下的文件
j	文件在写入时会被记录在journal中
S	一旦文件修改,立即将改动存入磁盘中
s	保密性删除文件或目录,删除时硬盘保存内容区域会被重写
u	与s相反,当删除文件后数据其实还存在硬盘中.

#注意
1.特殊文件属性代码有:AacDdijsSu.

#示例
chattr +i /etc/resolv.conf
chattr +a /var/log/messages