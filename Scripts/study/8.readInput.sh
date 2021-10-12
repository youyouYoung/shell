#!/bin/bash
#脚本要和用户做交互的话，不仅仅只是在脚本调用的开始时间输入参数而已
#read命令可以让脚本在执行过程中接受用户的输入

echo -n "please input your login name: "	#-n可以让用户的输入不换行
read name
if [ `whoami` = $name ]
then
	echo hello $name, welcome to you\!
else
	echo sorry $name, you are not "login."
	exit 0
fi

#read可以隐藏输入的内容，使其不在命令行上显示。一般情况下linux的密码输入都是这样的
read -sp "Enter your password: " pass
echo your password is $pass.

#我们可以将提示符放在read命令的同一行
read -p "please input your age: " age	#-p可以是我们直接在read命令后面加上提示语句
echo your age is $age.

#可以指定多个变量来接收用户输入，如果用户的输入比变量数多那么最后一个变量中将保存剩余的所有用户输入
read -p "输入三个变量: " var1 var2 var3
echo var1 is $var1
echo var2 is $var2
echo var3 is $var3

#如果read没有指定变量的话，将会把输入保存在环境变量REPLY中
read -p "请输入多个变量： "
count=1

for var in $REPLY
do
	echo the NO.$[count++] is $var.
done

#设置用户输入的时间，如果超过规定时间用户不能在输入
if read -t 5 -p "please intput name in 5s: " name
then
	echo hello $name.
else
	echo
	echo sorry, to slow\!
fi

#read可以对输入的字符个数计数，到要求个数时不用输入回车就可以退出将值付给变量
while true
do
	read -n1 -p "Do you want to continue [Y/N]? " answer
	echo
	case $answer in
		y | Y)	
			echo we will contiue.
			break;;
		n | N)	
			echo we will "exit".
			break;;
		*)
			echo Unknown answer, please input again\!
	esac
done
