#!/bin/bash
#该脚本可以输入三个选项：-a -b -c
#其中-b需要接收一个参数，对于错误的选项我们会报错并停止脚本的运行

#count=1		#记录选项的个数
#set -- `getopt -q ab:c "$@"`	#格式化用户输入的参数
##getopt -q 表示getopt命令没有介绍信息和错误信息
#echo $@

#while [ -n "$1" ]
#do
#	case $1 in
#	-a)
#		echo the NO.$count is -a option.;;
#	-b)
#		echo -n the NO.$count is -b option
#		echo " and their param is $2."
#		shift;;
#	-c)
#		echo the NO.$count is -c option.;;
#	--)
#		shift
#		break;;
#	-*)
#		echo the NO.$count option $1 is wrong\!
#		exit;; 	#其实这个选项是没有用的
#	*)
#		echo the NO.$count option $1 is wrong\!
#		exit;;  #其实这个选项事没有用的
#	esac
#	shift
#	count=$[ $count+1 ]
#done
#
#echo
#count=1
#for param in $@
#do
#	echo the NO.$[count++] param is $param.
#done

#getopt存在很多的问题
#1.getopt在格式化用户输入的参数时会忽略没有在getopt中定义的参数，所以即便用户输入的参数有误，也不会被发现。这就是上面-*)、*)没有作用的原因
#2.getopt无法将带有空格的选项参数视为一个，即如果出现 -ac -b "yang youyou" tese test. getopt会将上述用户输入格式化为：-a -c -b yang -- youyou tese test
#3.getopt只会将用户的输入视为字符串并格式化，不会将输入分成一个个的参数。即最后格式化完成的结果仍然是一个字符串
#4.getopt的选项和参数之间必须有空格分开，-b test.如果出现-btest会出错

#这里有一个对getopt加强的命令：getopts
#getopts有两个环境变量可供使用：$OPTARG、$OPTIND
#$OPTARG:保存需要带参数选项的参数
#$OPTIND:保存正在处理的参数的位置
#使用之后发现getopts的一些问题：
#1.使用getopts格式化输入参数，必须将选项置于普通参数前

#echo $@ 用于测试

while getopts :ab:c param
do
	#echo $OPTIND：$OPTARG：$param 用于测试
	case $param in
	a)
		echo the $OPTIND option is $param.;;
	b)
		echo -n the $OPTIND option is $param
		echo " and this param is $OPTARG.";;
	c)
		echo the $OPTIND option is $param.;;
	*)
		echo unknown input on $OPTIND\: $param;;
	esac
done

#echo $OPTIND 用于测试
echo 以下是用户输入：
shift $[$OPTIND-1]
for param in $@
do
	echo the next param is $param.
done
