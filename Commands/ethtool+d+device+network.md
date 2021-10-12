#用于管理网卡设备的参数
语法:ethtool 网卡设备号

#常用选项
-h		#显示命令的帮助信息
-i		#查看指定网卡的信息
-d		#查看指定网卡的注册性信息
-r		#重置网卡到自适应模式
-S		#查询指定网卡的收发包统计
-s		#设置网卡的相关信息
-a		#查看网卡中接收模块RX,发送模块TX,Autonegotiate模块的状态

#注意
1.-s选项可以设置的属性,以及对应的属性值:
属性名		可选取值	说明
speed		10|100|1000	网口速率
duplex		half|full	网口半/全双工
autoneg		on|off		是否自协商

#示例
ethtool -s eth1 autoneg off speed 100 duplex full
ethool eth0		#查看机器上网卡的速度,输出信息中‘Speed:’
ethtool -K eth0 rx off	#关闭网卡对收到的数据包的校验功能
