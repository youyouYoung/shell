#用于获取主机硬件信息
语法:dmidecode 选项 参数

#常用选项
-d file		#从设备文件读信息，输出内容与不加参数标准输出相同
-h		#显示命令帮助
-q		#显示更少的简化信息
-s DMI选项	#只显示指定DMI选项的信息
-t 样式		#只显示指定条目的信息
-u		#显示未解码的原始条目内容

#注意
1.-t选项后可以跟的样式参数:BIOS,System,Base Board,Chassis,Processor,Memory Controller,Memory Module,Cache,Port Connector,System Slots,On Board Devices,On Board Devices,OEM Strings,OEM Strings,System Configuration Options,System Configuration Options,BIOS Language,BIOS Language,Group Associations,Group Associations,System Event Log,System Event Log,Physical Memory Array,Physical Memory Array,Memory Device,Memory Device,32-bit Memory Error,32-bit Memory Error,Memory Array Mapped Address,Memory Array Mapped Address,Memory Device Mapped Address,Memory Device Mapped Address,Built-in Pointing Device,Built-in Pointing Device,Portable Battery,Portable Battery,System Reset,System Reset,Hardware Security,Hardware Security,System Power Controls,System Power Controls,Voltage Probe,Voltage Probe,Cooling Device,Cooling Device,Temperature Probe,Temperature Probe,Electrical Current Probe,Electrical Current Probe,Out-of-band Remote Access,Out-of-band Remote Access,Boot Integrity Services,Boot Integrity Services,System Boot,System Boot,64-bit Memory Error,64-bit Memory Error,Management Device,Management Device,Management Device Component,Management Device Component,Management Device Threshold Data,Management Device Threshold Data,Memory Channel,Memory Channel,IPMI Device,IPMI Device,Power Supply,Power Supply,Additional Information,Additional Information,Onboard Device,Onboard Device

#示例
dmidecode -t memory		#查看内存型号
dmidecode |grep 'Product Name'	#查看服务器型号
dmidecode |grep 'Serial Number'	#查看主板的序列号
dmidecode -s system-serial-number	#查看系统序列号




