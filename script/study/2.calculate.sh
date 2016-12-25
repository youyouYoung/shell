#!/bin/bash
#脚本中的算数运算。shell不能直接执行算数运算，需要借助其他命令来共同完成。
#expr就是其中的一种方式。他可以执行你指定的算术运算，并将结果返回。
#使用方法： expr arg1 操作符 arg2

echo `expr 1 + 5`
#expr可执行的算符操作：
# 操作符		描述
# |			如果没有参数是0或空，返回agr1，否则返回agr2
# &			如果没有参数是0或空，返回agr1，否则返回0
# <			小于
# <=			小于等于
# =			
# !=			
# >=			
# >			以上判断操作，为真返回1，假返回0
# +			
# -			
# *			
# /			
# %			取余，以上算数运算返回计算结果
#
#STRING : REGEXP	如果在STRING中匹配到REGEXP，将返回匹配数据
#match STRING REGEXP	和上面的一样
#substr STRING POS LENGTH	返回STRING中从POS位置开始长度为LENGTH的数据
#index STRING CHARS	返回STRING中CHARS所在的位置，如果不存在返回0
#length STRING		返回STRING的长度
#+ TOKEN		将TOKEN解释成字符串，即使是关键字
#(EXPRESSION)		运行EXPRESSION，将结果返回
#
#expr运算中*有时会被shell解释成通配符，为了解决这个问题需使用：
#expr 5 \* 3



#为了解决expr的各种问题，bash shell提供了另外一种更好的解决方式：
#$[EXPRESSION]
#shell会将expression中的表达式按照算数运算执行，并将结果返回
count=1
echo $[$count+1]
echo $[5/4]
#可以看到bash shell只支持整数运算



#为了解决bash shell不能计算浮点数，我们使用bash提供的内建计算机	bc
#bc -q可以去除调用bc时的欢迎条
#scale为bc命令内控制小数点的精确度的变量
#使用方法一：
num=`echo "scale=4; 5/4" | bc`
echo $num

#使用方法二：
result=`bc << EOF
scale=5
num1=3
num2=10
num2/num1
EOF`
echo $result
