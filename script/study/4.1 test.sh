#!/bin/bash
#if判断的条件只能是退出的状态码，如果我们需要比较大小等这些判断条件是没办法直接写在if后面的。
#bash shell为了使if测试更多的条件，提供给我们一个test命令。
#格式：test condition 或者 [ condition ] .注意左右括号和condition之间各有一个空格。
#如果test中列出来的条件成立，test将0作为退出的状态码。如果条件不成立退出状态码为1。

test 1 -gt 2
echo $?		#输出1

[ 1 -le 2 ]
echo $?		#输出0


#test命令可以判断3类条件
#1.数值比较
#2.字符串比较
#3.文件比较

#数值比较
#比较				描述
#n1 -eq n2			等于
#n1 -ge n2			大于等于
#n1 -gt n2			大于
#n1 -le n2			小于等于
#n1 -lt n2			小于
#n1 -ne n2			不等于
var1=10
var2=13
[ $var1 -gt $var2 ]
echo $?

#字符串比较
#   比较			描述
#str1 = str2			是否相同
#str1 != str2			是否不等
#str1 < str2			小于
#str1 > str2			大于
#-n str				长度是否不为0
#-z str				长度是否为0
if [ whoami = youyou ]
then
	echo successful logining
else
	echo you are not youyou
fi

#文件比较
#比较				描述
#-d file			存在并是目录
#-e file			存在
#-f file			存在并是文件
#-r file			存在并可读
#-s file			存在并非空
#-w file			存在并可写
#-x file			存在并可执行
#-O file			存在并属于当前用户
#-G file			存在并和当前用户是同一组
#file1 -nt file2		file1比file2新，可用于备份文件
#file2 -ot file2		file1比file旧
