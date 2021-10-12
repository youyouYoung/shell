#用于管理软件包以及依赖包
aptitude 操作选项

#常用选项
update			#更新可用的包列表
upgrade			#升级可用的包
dist-upgrade		#升级系统
install 软件包		#安装包
remove 软件包		#删除包
purge 软件包		#删除包及其配置文件
search 软件包		#搜索软件包
show 软件包		#查看软件包详细信息
clean			#删除下载的包文件
autoclean		#仅删除过期的包文件

#注意
1.aptitude和apt-get都具有管理包的能力,aptitude在处理依赖关系上更优越一些.

#示例
aptitude show gedit
