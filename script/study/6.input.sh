#!/bin/bash
#对用户输入的处理
#bash shell中用一些将一些环境变量分配用来记录用户在命令上输入的参数，也包括被操作的shell文本的名字。把这些变量称为位置参数，每个位置参数的含义如下：
#$0:程序名。$0-$9:分别表示第一到第九个参数
#basename命令可以去除程序名前面多余的路径标识

echo 当前脚本名（包含路径）为：$0
echo 当前脚本名（不包含路径）为：`basename $0`
echo ------------------------------------------------------------------

#执行命令bash 6.input.sh test1 test2,获取两个参数

if [ -n "$1" ] && [ -n "$2" ]
then
	echo 第一个参数为$1
	echo 第二个参数为$2
	echo ----------------------------------------------------------
else
	echo 没有正确输入第一二个参数
	exit
fi

#执行命令bash 6.input.sh test1 test2 yang guang
#理想输出为：hello yang guang, glad to meet you.
#实际输出为：hello yang, glad to meet you.
#我们需要将命令改成：bash 6.input.sh test1 test2 "yang guang"，就可以正确执行了

if [ -n "$3" ]
then
	echo hello $3, glad to meet you.
	echo ----------------------------------------------------------
else
	echo 没有输入第三个参数
	exit
fi

#bash shell提供了一个环境变量可以获取命令行中输入的参数的个数，即#
#我们通过$#来获取参数的个数

if [ $# -lt 4 ]
then
	echo 该命令需要4个参数
	exit
else
	echo 第四个参数为：$4
fi
echo ------------------------------------------------------------------

#因为$#保存参数的个数,那么我们就可以直接获取到最后一个参数的值了
#我们通过${!#}方式获取到最后一个参数的值，注意不能使用${$#}

if [ $# -ne 0 ]
then
	echo 最后一个参数为${!#}
fi
echo ------------------------------------------------------------------

#bash shell提供了两个环境变量可以获得命令行上的所有数据，分别是：*、@
#可以通过$*、$@来获取所有的参数，单这两种方式又有一些不同的地方
#$*获取的参数不能使用空格将他们分成一个个单独的参数，但$@可以
#可以用这两个变量来得到命令行参数的个数

echo \$*获取到的数据是：$*
echo \$@获取到的数据是：$@
count=1

for param in $*
do
	echo \$*获取到的第$[count++]个参数是：$param
done

count=1
for param in $@
do
	echo \$@获取到的第$[count++]个参数是：$param
done

echo
echo 注意两次\$*输出的区别
echo

count=1
for param in "$*"
do
	echo \$*获取到的第$[count++]个参数是：$param
done

count=1
for param in "$@"
do
	echo \$@获取到的第$[count++]个参数是：$param
done
echo ------------------------------------------------------------------

#移动变量:shift
#shift可以像移动光标位置一样移动参数的位置，例如在第一次使用shift之后$2的变量会到$1的位置上

count=1

echo
echo 使用shift循环遍历变量
while [ -n "$1" ]
do
	echo 第$[count++]个参数是：$1
	shift
done
echo ------------------------------------------------------------------

#为命令添加选项，有个命令可以通过添加选项来改变命令的作用。我们可以通过实现这样的命令
#输入：bash 6.input.sh而且该命令可以接受三种选项 -a -b -c
#linux规定命令行输入的标准：--之前写该命令所有的参数，--之后写所有的输入

while [ -n "$1" ]
do
	case $1 in
		-a) echo this is -a option;;
		-b) echo this is -b option;;
		-c) echo this is -c option;;
		--) shift
		    break;;
		*)  echo "$1 isn't a option";;
	esac
	shift
done

#使用getopt格式化输入的命令参数，我们知道很多选项都是连在一起写的。如-ac
#这时就可以只用getopt格式化用户输入的参数，格式为：
#getopt options optstrings
#options的写法为：没有参数的直接连在一起写就行，有参数的在后面加上冒号:，例如ab:cd，说明该命令有四个选项，其中b选项后面会跟有参数
#optstring为用户的输入
#最后我们需要的是将格式化后的字符串输入给脚本，我们使用set完成
#set -- `getopt -q ab:cd "$@"`
