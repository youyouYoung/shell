#用于对给定的条件做判断,并返回判断结果
test 条件语句
[ 条件语句 ]

#注意
1.测试的结果将以退出状态码的形式表现.
2.如果结果为真将0作为退出的状态码,如果条件不成立退出状态码为1.
3.[ 条件语句 ]是test的另一种写法,左右括号和条件语句之间至少有一个空格.
4.test命令可以判断3类条件:a.数值比较,b.字符串比较,c.文件比较
#		数值比较
#比较			描述
#n1 -eq n2		等于
#n1 -ge n2		大于等于
#n1 -gt n2		大于
#n1 -le n2		小于等于
#n1 -lt n2		小于
#n1 -ne n2		不等于
#		字符串比较
#str1 = str2		是否相同
#str1 != str2		是否不等
#str1 < str2		小于
#str1 > str2		大于
#-n str			长度是否不为0
#-z str			长度是否为0
#		文件比较
#-a file		存在
#-b file		存在并是块设备文件
#-c file		存在并是字符文件
#-d file		存在并是目录
#-e file		存在
#-f file		存在并是文件
#-g file		存在并设立了set group id属性
#-h file		存在并是链接文件
#-k file		存在并设立了sticky位属性
#-p file		存在并是管道文件
#-r file		存在并可读
#-s file		存在并非空
#-t 文件描述符		文件描述符开启且链接到某个终端
#-u file		存在且设立了set user id属性
#-w file		存在并可写
#-x file		存在并可执行
#-O file		存在并属于当前用户
#-G file		存在并和当前用户是同一组
#-L file		存在并是符号链接文件
#-S file		存在并是socket文件
#-N file		存在并在上次读取后被修改过*******备份要用
#file1 -nt file2	file1比file2新，可用于备份文件
#file2 -ot file2	file1比file旧
#		bash选项状态
#-o set 选项名称	选项开启(选项开启时为真)

#示例
test 1 -gt 2		#退出状态码保存在$?中
[ 1 -lt 2 ]		#同上
[ ! -e file]		#注意:!与条件语句之间要有空格符隔开
var1=10
var2=13
[ $var1 -gt $var2 ] && echo $?
[ whoami = youyou ]&& echo successful logining|| echo you are not youyou			#用于判断用户身份
