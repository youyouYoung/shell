#用于将设备挂载到指定位置
语法:mount [-t 文件系统类型] [-o 挂载方式] 设备 路径

#注意
1.常见的文件系统类型:
	光盘或光盘镜像：iso9660
	DOS fat16文件系统：msdos
	fat/fat32文件系统：vfat
	ntfs文件系统：ntfs
	windows网络共享目录：smbfs
	UNIX(LINUX) 文件系统：reiserfs、ext3、xfs
2.挂载方式有:
	loop：用来把一个文件当成硬盘分区挂接上系统
	ro：采用只读方式挂接设备
	rw：采用读写方式挂接设备
	iocharset：指定访问文件系统所用字符集
3.如果中文名无法显示尝试在最后增加 -o nls=utf8 或 -o iocharset=utf8 
4.如果需要挂载后，普通用户也可以使用，在 -o 的参数后面增加 ,umask=022 如：-o nls=utf8,umask=022

#示例
mount /dev/sda6 ./test
mount -t ntfs -o nls=utf8,umask=0 /dev/sdb1 /mnt/c  #只读挂载ntfs分区 
mount -t ntfs-3g -o locale=zh_CN.utf8,umask=0 /dev/sdb1 /mnt/c  #可写挂载ntfs分区 

----------------------------------------------------------------------
分区卸载
umount 目录名或设备名
