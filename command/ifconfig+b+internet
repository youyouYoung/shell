#用于配置和显示网卡信息.
语法:ifconfig 网络设备号 参数

#常用参数
up			#启动指定网络设备
down			#禁用指定网络设备
arp			#设置网卡是否支持arp协议,arp:支持 -arp:不支持
-a			#显示全部接口信息
-s			#显示摘要信息
add ipv6		#给指定网卡配置ipv6地址
del ipv6		#删除指定网卡的ipv6地址
hw 网络设备类型 硬件地址	#设置网络设备的类型和地址
mtu 字节数		#设置网卡的最大传输单元 (bytes)
netmask 子网掩码	#设置网卡的子网掩码
io_addr I/O地址		#设置网络设备的I/O地址
tunnel 地址		#建立IPv4与IPv6之间的隧道通信地址
ip地址			#为指定网卡设置ipv4地址
-promisc		#设置是否支持网卡的promiscuous模式
-allmulti		#设置是否支持多播模式

#注意
1.一个ip地址是由32位组成的，ip的地址按照国际标准划分为a,b,c,d,e五类
	a类：前面有8位网络号
	b类：前面有16为网络号
	c类：前面有24位网络号
目前主要使用的即使以上三种ip类型

2.ip地址的组成:网络号+主机号.所以网络号位数越少,可分配的主机数就越多.

3.广播地址:
局域网广播：1111111......(32位)
子网广播：网络号+1111111(共32位)

4.回路：127.任意数字（除去全0或者全1）

5.推荐书籍:TCP/IP详解（美国史蒂文斯），卷1：协议,卷2：实现,卷3：TCP事务协议 HTTP NNTP和unix域协议

6.支持promiscuous模式时网卡将接收网络中发给它所有的数据包

7.支持多播模式时网卡将接收网络中所有的多播数据包

8.对ifconfig的结果中部分字段的解读:
eth0表示第一块网卡,lo是表示主机的回坏地址,wlan0表示是无线网卡
eth0      Link encap:Ethernet  HWaddr 74:d0:2b:b0:82:3a 
	  link encap表示网络连接的类型,Ethernet是以太网,HWaddr是mac地址
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
	  上面表示网卡的运行状态
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
	  RX和TX是网卡收发包的情况
          collisions:0 txqueuelen:1000
	  conllisions表示以太网发生冲突的次数,该值过高可能是网络硬件连接出现的问题
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:3646 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3646 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:350683 (350.6 KB)  TX bytes:350683 (350.6 KB)

wlan0     Link encap:Ethernet  HWaddr 24:fd:52:b9:cd:6c  
          inet addr:192.168.1.101  Bcast:192.168.1.255  Mask:255.255.255.0
	  Inet addr是网络的ip地址,Bcast是网络的广播地址,Mask是子网掩码
          inet6 addr: fe80::26fd:52ff:feb9:cd6c/64 Scope:Link
	  inet6 addr是网络的ipv6的地址
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
	  上面表示网卡的运行状态
          RX packets:97310 errors:0 dropped:0 overruns:0 frame:0
          TX packets:80912 errors:0 dropped:0 overruns:0 carrier:0
	  RX和TX是网卡收发包的情况
          collisions:0 txqueuelen:1000 
	  conllisions表示以太网发生冲突的次数,该值过高可能是网络硬件连接出现的问题
          RX bytes:127609810 (127.6 MB)  TX bytes:8779789 (8.7 MB)
9.修改mac地址前,先停止被修改的网卡.

#示例
ifconfig wlan0 192.168.01.11		#配置无线网卡的ip地址
ifconfig eth0 192.276.91，192		#配置第一个网卡的ip地址
ifconfig eth0				#查看eth0的设备信息
ifconfig eth0 down			#关闭网卡
ifconfig eth0 hw ether 00:AA:CC:DD:EE	#更改网卡的mac地址
ifconfig eth0 up 			#启动网卡
#修改网卡的ipv6信息
ifconfig eth0 add 33ffe:3240:800:1005::2/64
ifconfig eth0 del 33ffe:3240:800:1005::2/64
ifconfig eth0 arp 			#开启网卡eth0的arp协议
ifconfig eth0 -arp			#关闭网卡eth0 的arp协议
ifconfig eth0 mtu 1500		#设置能通过的最大数据包大小为1500bytes
