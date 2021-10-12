#用户显示系统和主机信息
语法:uname 选项

#常用选项
-a	#按照如下次序输出所有信息。其中若 -p 和 -i 的探测结果不可知则被省略：
-s	#输出内核名称
-n	#输出网络节点上的主机名
-r	#输出内核发行版
-v	#输出内核版本
-m	#输出主机的硬件架构名称
-p	#输出处理器类型或“unkown”
-i	#输出硬件平台或“unknown”
-o	#输出操作系统名称

#示例
uname -a	#查看所有信息
uname -m