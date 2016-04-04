#!/bin/bash
#脚本中的一些基础知识

#1.环境变量：shell脚本中用于保存信息的变量
#1.1 保存当前进程PID的环境变量：
var=$$
echo $var
#1.2 history文件的位置
var=$HISTFILE
#1.3 history文件保存记录的最大行数
var=$HISTFILESIZE
#1.4 可互动shell中记录的历史指令的数目
var=$HISTSIZE

#2.数组变量
array=(0 1 2 3 4 5 6)		#数组的定义
#数组的引用
echo ${array[*]}
echo ${array[1]}
