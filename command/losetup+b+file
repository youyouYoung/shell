#用于设置环回文件
语法:losetup 选项 环回设备名 环回文件

#常用选项
-d			#卸载设备
-e 加密方式		#设置加密方式
-o 数量			#设置数据的偏移量
-f			#找出第一个没有被使用的环回设备文件

#注意
1.环回文件是一种可以被当做设备文件挂载在主机上的文件.本身具有文件系统
2.linux中的环回设备有/dev/loopn,n为数字
3.如果只给出来还会设备名,那么将显示该设备的状态.

#示例
#创建一个磁盘镜像文件
dd if=/dev/zero of=file.img bs=2 count=2G
#使用losetup将磁盘文件虚拟成环回文件设备
losetup /dev/loop1 file.img
mkfs.ext4 file.img
#挂载块设备
mount /dev/loop1 /tmp
#卸载loop设备
umount /tmp
losetup -d /dev/loop1
