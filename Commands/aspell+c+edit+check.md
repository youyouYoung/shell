#用于检查单词拼写中的错误
语法:aspell 选项

#常用选项
-c input	# 以交互式的方法来告诉操作者, 输入中的拼写错误. 不接受标准输入
		# 并提供可替换选项以及其他操作, 只需要选择提供的操作前面的字符就行.
		# 按照顺序执行, 在前一个错误被纠正之后会提示下一个错误.
-l input	# 批处理的方式显示输入中所有的拼写错误. 不接收标准输入

#注意
1.通过交互式操作修改了原文件之后, 该命令会生成一个备份文件用以保存之前的结果.

#示例
aspell list <file