#用于设置环境变量.增加,删除等
语法:export 选项 变量名

#常用选项
-p			#列出目前所有的环境变量
-f			#将参数视为函数
-n			#指定变量不在是环境变量

#注意
1.命令declare -x num=1,同样可以将num变量定义为环境变量.
2.子父shell之间不能共享普通变量,父shell通过将变量定义为环境变量来实现与子shell的变量共享.
3.没有参数时列出目前所有的环境变量

#示例
export var		#将变量var申明为环境变量
export -f fun		#将函数fun申明为环境变量