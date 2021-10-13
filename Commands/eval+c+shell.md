#对参数进行扫描替换,然后如果可执行就执行参数内容
语法:eval 参数

#注意
1.该命令适用于那些一次扫描无法实现功能的变量.
2.该命令对变量进行了两次扫描,第一次对其中的变量进行替换,第二次执行替换后的结果.

#示例
用于简单的显示变量内容
name=youyou
eval echo $name

对变量的两次扫描
var="ls -al"
echo $var
eval echo $var

将变量视为命令去执行
eval var
var="ls -l"
eval $var	#表示将执行ls -l命令
