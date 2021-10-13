#防止外网用内网IP欺骗
#eth0 为外网网卡
sudo iptables -t nat -A PREROUTING -i eth0 -s 10.0.0.0/8 -j DROP
sudo iptables -t nat -A PREROUTING -i eth0 -s 172.16.0.0/12 -j DROP
sudo iptables -t nat -A PREROUTING -i eth0 -s 192.168.0.0/16 -j DROP 

#阻止一个IP连接本机
#规则位于最后
sudo iptables -t filter -A INPUT -s 192.168.1.125 -i eth0 -j DROP 

#关闭 1234 端口
sudo iptables -A OUTPUT -p tcp --dport 1234 -j DROP

#开启 80 端口
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

#限制访问80端口的外部IP最大只有50个并发
sudo iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 50 --connlimit-mask 32 -j DROP

#禁止一个IP或者一个IP段访问服务器端口服务
#80端口 ，规则插入到前面
sudo iptables -t filter -I INPUT -s 192.168.2.0/24 -p tcp --dport http -j DROP

#21端口，规则插入到前面
sudo iptables -t filter -I INPUT -s 192.168.1.23 -p tcp --dport ftp -j DROP
