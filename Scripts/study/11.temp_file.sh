#!/bin/bash
#linux上创建临时文件的命令：mktemp。他可以创建一个属于当前用于拥有的临时文件。
#格式：mktemp 文件名模板。其中文件名模板可以是任意的名称只需要在文件的末尾加上6个X。
#最后生成的文件名会是指定的文件名其中XXXXXX会被换成6个随机数

#在当前目录下创建临时文件
filename=`mktemp testing.XXXXXX`
echo $filename
rm -f $filename

#在/tmp下创建临时文件
#-t会会强制mktemp在系统的临时目录/tmp下创建文件。此时命令将会返回临时文件的全路径名
filename=`mktemp -t tempXXXXXX`
echo $filename
rm -f $filename

#创建临时目录
#-d选项告诉mktemp创建的临时对象是一个文件夹
tdir=`mktemp -d tempdirXXXXXX`
echo $tdir
rm -rf $tdir
