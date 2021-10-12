路由：是指将数据由来源网络送往目的网络的操作
route   //显示本机的路由表，查看本机的路由状况
路由表中写有和本机直接联通的路由器的地址信息


// 查看路由信息
sudo route -n


// 手工增加一条路由
sudo route add -net 192.168.0.0 netmask 255.255.255.0 gw 172.16.0.1


// 手工删除一条路由
sudo route del -net 192.168.0.0 netmask 255.255.255.0 gw 172.16.0.1


