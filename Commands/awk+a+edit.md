#awk是一种可以处理数据并产生格式化报表的语言,gawk是awk的升级版本.
语法:awk 选项 awk命令 待处理文件

#常用选项
-F			#指定读入的每条记录中的分隔符
-f			#awk语法脚本

#awk内置变量
ARGC			#命令行参数个数
ARGV			#命令行参数排列
ENVIRON			#支持队列中系统环境变量的使用
FILENAME		#awk浏览的文件名
FNR			#浏览文件的记录数
FS			#设置输入域分隔符，等价于命令行 -F选项
NF			#浏览记录的段的个数
NR			#已读的记录数
OFS			#输出各段间的分隔符
ORS			#输出各记录间的分隔符
RS			#控制记录分隔符

#常见的awk函数
1.print,printf
这是两种输出函数,可指定输出格式和内容.
print函数的参数可以是变量,数值或者字符串.字符串必须用双引号引用,参数用逗号分隔.如果没有逗号,参数就串联在一起而无法区分.输出的每个参数之间使用空格作为分隔符.
对于printf函数,其用法和c语言中printf基本相似,可以格式化字符串,输出复杂时,printf更加好用,代码更易懂.

2.gsub(r,s)
将一条记录($0)中的r数据替换成s数据.

3.gsub(r,s,t)
将t指定的字段中的r数据替换成s数据.

4.index(s,t)
获取在字符串t中第一次出现s的位置

5.length(s)
获取s的长度

6.match(s,r)
测试s中是否包含有r数据

7.substr(s,p,n)
获取字符串s中从p位置开始长度为n的子字符串.

8.getline
获取文件中新的一条记录

9.sub(r,t)
将字符串中符合r格式的内容替换为t.

10.tolower(s)
将字符串中的内容全部转为小写. 一般在字符匹配的过程中如果不考虑大小写的话建议先使用该函数对字符串转为小写或者使用下面的转为大写.

11.toupper(s)将字符串中的内容全部转为大写.

#注意
1.awk的工作流程:
a:将输入数据按照'\n'换行符分割成一条条的记录,每次读取一条记录.
b:按照IFS的其他两个选项(空格,tab),将一条数据分割成多个段.
c:按照awk命令指定的方式处理每条记录.

2.awk命令的结构为'BEGIN{} 样式{} END{}',其中各段含义({}中为具体操作):
BEGIN{}:在处理待处理文件之前做的操作.
样式{}:按照样式重复检查每条记录,对符合样式的记录执行'{}'中的操作.
END{}:在处理完所有记录之后做的操作.
以上的三种操作都是awk命令的可选部分,他们中的任何一部分都可以不出现在awk命令中.

3.如果没指定样式,默认对所有的记录都执行'{}'中的操作.如果没有指定操作方式,默认输出符合样式的记录.

4.对于任意一条记录,按照指定的分隔符划分成段.
$0表示这条记录的所有段.
$n表示这条记录的第n段(n为数字).

5.awk是一种语言,通过在花括号'{}'括起来的awk语句完成具体操作.awk有自己的内置变量和函数,通过这些和自己创建的变量,函数来完成具体的操作.
一个操作({})中可以有多个语句,每条语句之间使用;隔开.

6.awk语法中条件语句的写法(从C语言借鉴的):
if (expression) {
    statement1;
} else if (expression1) {
    statement2;
} else {
    statement3;
}

7.常见的条件操作符有:
<			#小于关系
<=			#小于等于关系
==			#相等关系
!=			#不等于关系
>=			#大于等于关系
>			#大于关系
~/正则表达式/		#左侧是否符合右侧的正则表达式
!~/正则表达式/		#左侧是否不符合右侧的正则表达式

8.awk中的循环语句同样借鉴于C语言，支持while、do/while、for、break、continue，这些关键字的语义和C语言中的语义完全相同.

9.awk中也可以使用数组,数组的下标有两种形式:数字或字符串,类似于shell中的数组.数组的键值对是是按照hash排序的,存储循序不一定和插入顺序相同.

10.awk中使用&&,||表示且,或的关系.

11.awk中使用的正则表达式会从最左侧开始匹配到第一个符合格式的最长子字符串

12.如果要使用正则表达式与某一个内容比较, 可以通过格式:带比较的内容 ~ 正则表达式或者带比较的字符串 !~ 正则表达式来实现.

#示例
awk '/ls/' data			#显示含有ls的行
awk '{print $1, $2}' data	#显示每行中的第一二个字段
awk '/ls/{print $1}' data	#显示含有ls的行中第一个字段

#找出文件中以youyou开头的记录,并以:作为分隔符.找出第一和第七字段.
awk -F: '/^youyou/{print $1, $7}' /etc/passwd

#以:为分隔符找出以sh结尾的行,并以分隔符'..'形式显示第1,2,3,4字段
awk -F: 'BEGIN{OFS=".."}/sh%/{print $1, $2, $3, $4}' /etc/passwd

#统计/etc/passwd:文件名，每行的行号，每行的列数，对应的完整行内容
awk -F ':' '{print "filename:" FILENAME ",linenumber:" NR ",columns:" NF ",linecontent:"$0}' /etc/passwd

#awk中变量的定义与使用,统计目录下的文件占用的字节数
ls -l |awk 'BEGIN {size=0;} {size=size+$5;} END{print "[end]size is ", size}'

#awk中数组的使用
awk -F ':' 'BEGIN {count=0;} {name[count] = $1;count++;}; END{for (i = 0; i < NR; i++) print i, name[i]}' /etc/passwd

#如果不指定操作方式, 默认是将匹配行全部显示出来
ls -l | awk '$2>1'	## 查询当前路径下所有有一个以上拷贝的文件

#引用脚本文件
awk -f program.awk file1 file2 ## 通过脚本program.awk中的内容逐行处理file1和file2

#可以在awk命令的最后面放搜索文件的位置设置变量, 不过在这些变量不能被BEGIN中的代码使用(低版本的awk中当变量的定义在所有的文件名称之前时, 会被BEGIN调用)
awk -F: '$7==var' var=/bin/bash /etc/passwd  ## 查找所有使用bash作为默认shell的行

#因为awk把待处理文件位置的所有内容都默认为文件, 虽然有可能是我们定义的变量. 
#所以由于awk的执行过程是顺序执行每个文件, 所以如果在这个位置定义的变量之前有需要处理的文件的话, 那么在处理这个文件的时候, 我们不能使用后面的变量的值
awk -F: '$7==varbash {print $1}; $7==varfalse {print $0}' varbash=/bin/bash /etc/passwd varfalse=/bin/false /etc/passwd  ## 上面的写法时在第一遍遍历passwd时, 将默认shll为bash的用户名输出, 第二遍是将默认执行程序为false的第二个字段输出

# 上面的这种变量定义放在处理文件位置的方式, 一般多用于定义FS,OFS,RS等这些变量, 因为每个文件的分隔符不一样, 所以可以再遍历这些文件之前根据文件的特异性指定文件需要的变量
awk '{print $1}' FS=: /etc/passwd FS=' ' mail-list ##mail-list是以空格作为分隔符的文件

# 当然也可以用来控制读文件
awk 'pass==1 {print $0} pass==2 {print $0}' pass=2 file1 pass=1 file2

#使用单独的一个减号'-'代表标准输入
ls -l |awk 'pass==1 {print $1} pass==2&&$5>100 {print $0}' pass=1 FS=: /etc/passwd pass=2 FS=' ' -  ##表示以:为分隔符输出第一个文件中第一个字段, 以空格作为分隔符输出标准输入中第五个字段大于100的行