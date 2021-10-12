#用指定大小的块拷贝一个文件.
语法:dd 选项

#常用选项
if=输入文件		#设置输入文件,要拷贝的文件
of=输出文件		#设置输出文件
ibs=bytes(数字)		#一次读取bytes字节，即读入缓冲区的字节数。
skip = blocks(数字)	#跳过读入缓冲区开头的ibs*blocks块才输入
seek = blocks(数字)	#跳过输出缓冲区开头的ibs*blocks块才输出
obs = bytes(数字)	#一次写入bytes字节，即写入缓冲区的字节数。
bs = bytes(数字)	#以字节为单位的块大小
cbs = bytes(数字)	#一次转换bytes字节。
count = blocks(数字)	#要被复制的块数.
conv = ASCII 		#把EBCDIC码转换为ASCII码。
conv = ebcdic 		#把ASCII码转换为EBCDIC码。
conv = ibm 		#把ASCII码转换为alternate EBCDIC码。
conv = blick 		#把变动位转换成固定字符。
conv = ublock 		#把固定位转换成变动位
conv = ucase 		#把字母由小写变为大写。
conv = lcase 		#把字母由大写变为小写。
conv = notrunc 		#不截短输出文件。
conv = swab 		#交换每一对输入字节。
conv = noerror 		#出错时不停止处理。
conv = sync 		#把每个输入记录的大小都调到ibs的大小(用ibs填充)。

#注意
1.同时定义bs和count的情况下,输出文件的大小为bs*count的大小.例如bs=2MB,count=2那么文件总大小为4MB.
2.块大小的计量单位:
符号		含义
c		字节(1B)
w		字(2B)
b		块(512B)
k		KB(1024B)
M		MB(1024KB)
G		GB(2014MB)

#示例
创建一个100M的文件
dd if=/dev/zero of=hello.txt bs=100M count=1

dd if=/dev/hdx of=/dev/hdy
