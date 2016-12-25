#expr用于运算的命令,可以进行算数/字符串操作
语法:expr 表达式

#注意
1.由于expr是外部命令,所以具有很强的跨平台性和可移植性.
2.其中表达式中运算符和操作数之间至少要有一个以上的空格符分开.
3.表达式支持的运算符有算数运算符和字符串运算符,分别是:
操作符			描述
 |			如果没有参数是0或空，返回agr1，否则返回agr2
 &			如果没有参数是0或空，返回agr1，否则返回0
 <			小于
 <=			小于等于
 =			
 !=			
 >=			
 >			以上判断操作，为真返回1，假返回0
 +			
 -			
 *			
 /			
 %			取余，以上算数运算返回计算结果
STRING : REGEXP		找到STRING中符合REGEXP的字符个数
match STRING REGEXP	和上面的一样
substr STRING POS LENGTH 返回STRING中从POS位置开始长度为LENGTH的数据
index STRING CHARS	返回STRING中CHARS所在的位置，如果不存在返回0
length STRING		返回STRING的长度
+ TOKEN			将TOKEN解释成字符串，即使是关键字
(EXPRESSION)		运行EXPRESSION，将结果返回

#示例
expr '1 + 5'
expr 'string' : st	#计算符合st的字符个数
expr index 'string' in	#in在string中的位置
expr + /		#将/视为一般字符
expr length "linux"		#计算字符串'linux'的长度
expr "linux" : '.*'		#计算字符串'linux'的长度
