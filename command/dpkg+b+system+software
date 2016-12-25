#dpkg是debian系统的后台包管理器.
dpkg 选项 参数

#常用选项
-l 		#显示全部已安装包的详细信息
-s 软件包	#显示指定文件的详细信息
-L 软件包	#列出执行包安装的所有文件清单
-S 文件		#查看某个文件属于那个软件包
-i deb文件	#安装deb文件
-r deb文件	#删除deb文件
-P		#彻底卸载,包括软件的配置文件
-c deb文件	#查询deb包所包含的文件
dpkg -L xxx //查看软件xxx安装内容

dpkg -S filename//查找文件属于那个包

//查看已经安装了那些包
dpkg -l 
dpkg -l | less


清除所有已删除包的残馀配置文件 
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P 

如果报如下错误，证明你的系统中没有残留配置文件了，无须担心。 
dpkg: --purge needs at least one package name argument

Type dpkg --help for help about installing and deinstalling packages [*];
Use `dselect' or `aptitude' for user-friendly package management;
Type dpkg -Dhelp for a list of dpkg debug flag values;
Type dpkg --force-help for a list of forcing options;
Type dpkg-deb --help for help about manipulating *.deb files;
Type dpkg --license for copyright license and lack of warranty (GNU GPL) [*].

Options marked [*] produce a lot of output - pipe it through `less' or `more' ! 
