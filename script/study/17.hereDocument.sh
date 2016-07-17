#!/bin/bash
#Here Document用来设定变量,是bash的一种特殊程序区域,用法如下:
#命令 <<标记
#......
#......
#......
#标记
#这样会把标记之间的内容,通过转向符交给命令去处理
echo "将标记之间的内容交给wc -l命令去处理"
wc -l <<MINE
line 1
line 2
line 3
MINE

#Here Document也支持变量替换,在输入内容中如果有变量,bash在转向前会先替换变量值
echo "Here Document支持变量替换操作"
from='realyangguang@gmail.com'
to='1120122221@bit.edu.cn'
subject='this is a test'
cat <<MINE
From:$from
To:$to
Subject:$subject
MINE

#在变量设定时运用Here Document
echo '在变量设定时运用Here Document'
hello='hello, i am you friend.'
var=$(cat <<MINE
line 1 is good.
$hello
MINE
)
echo $var

#控制Here Document的格式
echo '关闭变量替换功能'
cat <<'MINE'
	Line 1 is good.
	$hello
MINE

echo '去掉每行之前的tab字符'
cat <<-MINE
	line 1 is good.
	$hello
MINE

#'#'在脚本中只能注释一行,使用Here Document做多行批注.
echo 'Here Document实现多行注释'
: <<MINE
:是一个空命令,不会做任何的操作
所以我们把任何内容作为:的参数可以视为注释
使用Here Document可以实现多行注释
我们也可以将这些内容重定向给/dev/null文件来达成相同的效果
MINE

#Here Document打包其他语言的原始码
echo '脚本携带攻击程序的原型'
echo '正在产生hello.c.....'
echo
cat <<'MINE' >./hello.c
#include <stdio.h>

int main()
{
	printf("hello world!\n");
	return 0;
}
MINE

echo '编译hello.c......'
echo
gcc -o hello hello.c

if [$? -eq 0]; then
	echo '执行hello......'
	echo
	./hello
else
	echo '编译错误!'
fi
