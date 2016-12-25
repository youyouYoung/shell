#!/bin/bash
#函数的创建和使用：

#1.函数的创建方式：
function fun1		#方式1
{
	echo 努力做好自己，全力去追她
}

fun2()			#方式2
{
	echo 选择是她的，我不能强迫
}

#使用函数
fun1
fun2

#2.函数返回值
#2.1 获取退出状态码
#退出状态码会返回函数执行的最后一句脚本的执行状态
echo $?

#2.2 使用return返回
#return的返回值其实就是人为给函数指定退出状态码
function fun3
{
	return 40
}
fun3
echo $?

#2.3 使用函数的输出
#通过在调用处获取函数的输出达到传值的目的
fun4()
{
	echo "this is a function."
}
$var=`fun4`
echo "this funtion return is $var."

#3.向函数传递参数
#shell会将函数当做脚本来处理，所以我们可以使用参数环境变量来获取调用函数时传递的参数。
function fun5
{
	echo $#
	echo $@
	echo $1
}
fun5 1 2 3 4 5

#4.全局变量和局部变量
#默认情况下，脚本中所有的变量都是全局变量。函数中可以任意访问脚本中在调用函数钱被定义的变量。
#为了能让变量的生命周期只在函数中，我们需要定义局部变量。使用local关键字就可以实现
fun6()
{
	local var=$1
	echo $[$var*3]
}
var=4
echo "in function: "`fun6 $var`
echo "out function: "$var

#5.函数中数组的使用
#给函数中传递数组的时候需要将数组变量分解为单个值来传递
function fun7
{
	local myarray=(`echo $@`)
	echo the new array is ${myarray[*]}
}
array=(1 2 3 4 5 6)
echo the orign array is ${array[*]}
function ${array[*]}
#从函数中返回数组是一样的方法
myarray=(`function ${array[*]}`)
echo myarray is ${array[*]}

#5.创建库文件
#有些函数可能会在多个脚本中被引用，为了方便起见我们创建一个保存函数的库文件。写法与shell脚本并没有任何区别，只是叫法不同而已
#shell在运行函数时，会将函数当做一个小型脚本文件来处理。即会为函数开启一个新的shell，并在其中完成函数功能。而且shell函数只对定义它的shell会话有效即新的shell中有效，这对于运行在调用shell函数的shell会话中的shell脚本不起作用
#库文件：myfunction
##!/bin/bash
#function add
#{
#	echo $1+$2
#}
#
#function mul
#{
#	echo $1*$2
#}
#如果我们在shell脚本中调用此库文件，是没有用的
##!/bin/bash
#./myfunction
#add 1 2		这句话会报错
#
#这时我们需要使用source命令，source命令会在当前shell中执行命令而不是创建一个新的shell执行命令。source还有一个快捷别名：. 称作点操作符
#我们可以使用以下方法引用上述库文件，这样就可以使用了
##!/bin/bash
#. ./myfunction
#echo `add 1 2`

#6.在命令行上定义函数
#很多时候我们会讲一些常用的方法定义成能直接从命令行上使用的函数，有两种办法可以实现。
#1.直接在shell终端下定义，存在一个问题是每次关闭终端后定义的函数也就没有了
#2.将自己的函数写在用户主目录下的.bashrc文件中，可以在任意的终端上使用定义过的函数了
