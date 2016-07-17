#!/bin/bash
#shell脚本中的判断结构，一共有两种：
#1.if else：用在选项不多的情况下
#2.case：用在选项比较多的情况下

#if结构的格式：
#if command
#then
#	commands
#else
#	commands
#fi
#
#if结构本身和我们在其他编程语言里用的不太一样，它是先执行command根据command的退出状态码是否为0判断进入那个条件。
#1.如果command返回0执行then后面的命令
#2.如果command返回非0执行else后面的命令
if date
then
	echo successful
else
	echo failed
fi

if whoiam
then
	echo ok
else
	echo sorry
fi

#嵌套if结构的格式：
#if command1
#then
#	commands
#elif	command2
#then
#	commands
#else
#	commands
#fi
#嵌套if和if else结构并没有太大差别
user=`whoami`
if [ $user = youyou ]
then
	echo hello youyou\!
elif [ $user = root ]
then
	echo hello root.
else
	echo sorry, "i don't konw you."
fi

#if-else的高级特性
#1.对数学表达式的计算比较，使用双小括号实现(( condition ))
#2.对字符串的处理，使用双中括号实现[[ condition ]]

#双小括号可以识别的运算符除了test命令可以识别的以外，还包括：
#符号				描述
#var++				后增
#var--				后减
#++var				先增
#--var				先减
#!				逻辑求反
#~				按位求反
#**				幂运算
#<<				左移
#>>				右移
#&				位与
#|				位或
#&&				逻辑与
#||				逻辑或
if (( 10 ** 2 > 90))
then
	echo 10^2\>90
fi

#双方括号采用了test命令中对字符串的比较符号，但是有特别加上了匹配模式。
#这样你可以使用正则表达式来匹配你的字符串
str1=youyou
str2=Youyou
if [[ $str2 = [Yy]ouyou ]] && [[ $str1 = [Yy]ouyou ]]
then
	echo welcome youyou
else
	echo sorry
fi


#case命令，用于具有多个选项的时候
case $USER in
youyou)
	echo welcome youyou;;
root)
	echo hello root;;
lx)
	echo 在我最无奈的年纪遇到我最想保护的人;;
sha|jsjia)
	echo hello guest;;
*)
	echo hi;;
esac
