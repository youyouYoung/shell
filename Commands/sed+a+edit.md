#sed是一种非交互式的流编辑器,可动态编辑文件.
sed '样式描述' 文件	#如果文件某一行符合样式描述,就执行sed命令(删除/替换等).

#常用选项
-n			#只显示文件中符合样式描述的行

#操作方式
d			#删除
s			#替换
p			#显示/打印到标准输出
g			#表示全局操作,与s/d连用表示替换/删除所有符合样式行

#注意
1.sed不能和使用者直接互动,它处理的对象是文件的数据流.
2.样式的写法:使用一对//含括.例如:/se*d/-表示sd中间有0-n个e字符.
3.sed并不会更改文件内容.sed的工作方式是读取文件内容经流编辑后,显示到标准输出.
4.sed的工作模式是:比对每一数据行,若样式符合就执行指定的操作

#示例
sed '1,4d' data		#删除1-4行的数据
sed '/la/d' data	#删除含有la的行
sed '/la/!d' data	#只有含la的行不删除
sed 's/la/oo/p' data	#将文本中每一行第一个la替换为oo后显示出来
sed 's/la/oo/gp' data	#将文本中所有的la替换为pp后显示.
sed '/la/s/h/he/p' data	#找到la所在行将其中的h替换为he
sed '/as/,/sa/p' data	#将含有as到含有sa的行输出
sed '1,4s/a/s/p' data	#将1-4行的a换为s后输出