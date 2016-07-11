#apt-get用于系统对软件的管理
语法:apt-get 操作

#常用操作
update			#更新本地数据库
upgrade 软件包		#更新软件包,没有指定软件包时升级所有软件包
check			#验证本地系统的完整性
dist-upgrade		#安装所有的基础软件包
install 软件包		#安装软件包
remove 软件包		#删除软件包
source 软件包		#下载软件包的source
clean			#删除保存在缓存目录(/var/cache/apt/archives/)下的软件包

#示例
apt-get upgrade
apt-get autoclean	#清除无用的软件和记录
apt-get autoremove	#删除系统不再使用的孤立软件 
apt-get autoremove --purge #会把这些孤立软件的残留配置文件也一并移除 

##系统升级，版本间
sudo apt-get update
sudo apt-get install update-manager-core
sudo do-release-upgrade

##查看网卡状态
sudo apt-get install ethtool 
sudo ethtool eth0

##激活网卡的 Wake-on-LAN 
sudo apt-get install wakeonlan
或 sudo ethtool -s eth0 wol g

##新添加源  ppa
sudo add-apt-repository ppa:fcitx-team/nightly

##控制台下显示中文
sudo apt-get install zhcon
使用时，输入zhcon即可
更具体的输入：zhcon --utf8 --drv=vga
如果在/etc/zhcon.conf中指定了分辨率，可以去掉--drv=vga以指定的分辨率启动。

##程序显示有些字大，有些小
sudo apt-get remove ttf-kochi-gothic ttf-kochi-mincho ttf-unfonts ttf-unfonts-core

##增加农历
sudo apt-get install lunar-applet
鼠标点击面板右键 -> 添加到面板 -> 农历日期
