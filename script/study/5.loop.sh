#!/bin/bash
#for循环的使用方式，格式：
#for var in list
#do
#	commands
#done
#shell中for的使用方式其实和许多面向对象的语言中的foreach用法一样，即遍历list中所有的内容，并在每次遍历时执行commands

count=1

for file in `ls -al`
do
	echo $[count++]-------\> $file
	#count=$[count++]
	#echo $count---------\> $file
done
echo ----------------------------------------------------------------

#更改字段分隔符，可以看到list中的内容会按照空格、制表符、回车符分成一个个单一变量，我们现在要做的是只按照回车符将list中的内容分开
#IFS环境变量定义了bash shell中作为字段分隔符的一系列字符
#使用方式：$IFS=$'\n'

count=1
IFS_OLD=$IFS	#保存原有的值
IFS=$'\n'

for file in `ls -al`
do
	echo $[count++]-----------\> $file
done
echo ----------------------------------------------------------------

#用通配符读取目录
for file in ./*
do
	echo $file
done
echo ----------------------------------------------------------------

#C语言方式的for命令执行方式,格式：
#for(( i=0; i<10; i++ ))
for(( i=0; i<10; i++ ))
do
	echo the next number is $i.
done
echo ----------------------------------------------------------------

#while的使用方式，格式：
#while test command
#do
#	commands
#done
number=10

while [ $number -gt 0 ]
do
	echo the next number is $[number--].
done
echo ----------------------------------------------------------------

#until的使用方式，格式：
#until test command
#do
#	commands
#done
#这里需要注意的是，until的用法和含义与while是完全相反的
#while循环是在条件为真的情况下执行.until循环则是在条件为假时.

#break,continue可以控制循环的次数，这两个命令的用法和其他一些编程语言中的用法是一样的。
#其中break，continue还可以选择跳出循环的层数。使用方式就是在命令的后面加上层数的数值。break 3:调出3层循环
