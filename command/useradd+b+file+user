#用于系统创建新用户
useradd 用户名

#常用选项
-g 群组		#创建用户同时将用户指定到组中
-D		#查看创建用户时默认分配给用户的属性
-c 用户信息	#指定用户GECOS信息,可使用chfn修改
-d 家目录的路径	#指定用户家目录位置
-e 过期日	#时间格式为YYYY-MM-DD(年月日)
-f n(数字)	#过期日几日后该账户失效.0表示一过期马上失效,-1表示不会自动失效.
-G 群组列表	#额外加入的群组列表
-m		#自动建立家目录,同时将/etc/skel下的文件复制一份到家目录下
-o		#建立账号时,可以使用已存在的UID
-p 密码		#指定一个已编码过的密码
-s shell	#指定登陆的shell
-u uid		#指定uid

#注意
1.使用useradd创建用户时,需自行指定账号在passwd文件中的各字段值.
2.如果没有在创建时指定的话(useradd name),将使用默认文件中对字段值的定义.默认文件为/etc/default/useradd.
3.-D选项后再加上其他选项,可修改建立账号时的默认值.(b,e,f,g,s)


#示例
useradd -g groupName userName //添加用户到指定的组中 

cat /etc/passwd  //查询系统中所有的用户


//add sudo right for user xi
cd /etc/sudo.d/
touch xi
xi ALL=(ALL)ALL>xi
