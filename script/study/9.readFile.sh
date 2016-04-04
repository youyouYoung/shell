#!/bin/bash
#read命令可以获取文件中的内容,我们使用管道命令实现

filename=1.base.sh
lineNum=1
#判断文件是否存在
if [ ! -f $filename ]
then
	echo 不存在指定文件：$filename
	exit
fi
#读取文件
cat 1.base.sh | while read line
do
	echo $[lineNum++]\: $line
done
echo
echo END
echo -----------------------------------------------------------------


#或者我们可以使用重定向标准输入方式来完成读取文件
lineNum=1
exec 0< $filename

while read "line"
do
	echo $[lineNum++]\: $line
done
echo
echo END
echo -----------------------------------------------------------------

#重定向输入
while read line
do
	echo $line
done < $filename
