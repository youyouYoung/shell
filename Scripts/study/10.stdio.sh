#!/bin/bash
#linux中输入输出的标准文件描述符。
#linux将对象当做文件来处理，并用标准文件描述符来表示每个文件对象。每一个文件描述符都可以标识一个会话中打开的文件。
#每个过程中最多可以有9个文件描述符，其中前三个被bash shell指定用于特殊用途

#文件描述符		缩写			描述
#0			STDIN			标准输入
#1			STDOUT			标准输出
#2			STDERR			标准错误
#对于一个终端来讲，标准输入STDIN就是键盘、标准输出STDOUT和标准错误STDERR就是屏幕
#我们可以通过重定向符（<，>）来改变输入、输出和错误。

#重定向错误：
ls -al baseasd 2> error

#重定向输出：
whoami 1> output

#重定向错误和输出
ls -l 10* askldf 2> error 1> output	#将错误和输出定向到不同文件
ls -l 4.* mzxv &> alloutput		#将错误和输出定向到同一个文件中

#在脚本中重定向输出
echo this is output >&1		#临时重定向
exec 1> output			#永久重定向

#在脚本中重定向错误
echo this is error >&2		#临时重定向
exec 2> error			#永久重定向

#在脚本中重定向输入
exec 0< filename

#bash shell中除了这三个标准输入输出描述符以外还有6个文件描述符。分别是3-8这6个文件描述符当做输入输出重定向都可以。
#下面是对其他6个文件描述符的使用
#1.创建输出文件描述符
exec 3> output_3
echo this is output. >&3

#2.重定向文件描述符。我们可以使用重定向符<,>将STDOUT、STDIN等重定向到其他文件中。但是如果想要标准输入输出的话就必须借用其他的文件描述符了。
#2.1 恢复标准输出文件描述符
exec 3> &1
exec 1> output
echo this is output1.
echo this is output3. >&3
exec 1> &3
echo now, this is normal output
#2.2 恢复标准输入文件描述符
exec 4< &0
exec 0< filename
while read line
do
	echo $line
done
exec 0< &4
#2.3 创建读写文件操作符，将一个文件既视为输入又作为输出
exec 3<> filename
read line <&3
echo this is 'test' >&3
#2.4 关闭文件描述符
exec 3>filename
exec 3>&-
#lsof会列出整个linux系统中每个进程对应的文件描述符，常用参数有一下两个：
#-p 指定一个需要查看的进程ID
#-d 指定要显示的文件描述符的个数
/usr/sbin/lsof -a -p $$ -d 0.1.2


#阻止命令输出，一些时候我们希望进程不要输出结果。我们可以将输出重定向到null文件中。
#linux中有一个特殊文件叫做null文件，就是文件里面什么都没有。任何重定向到其中的数据都不会保存。他的位置在/dev/null
ls -al > /dev/null

#将输出发送到两个地方，有时候我们需要将输出即显示到屏幕又保存到文件中。我们就可以使用tee实现：
#tee像一个双向输出通道一样，他会将通过STDIN输入进来的数据即输出到STDOUT又输出到指定目录下
ls | tee output
#tee每次输出都会覆盖源文件中数据，如果想要做到追加的话可以使用-a选项
