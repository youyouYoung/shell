# zip
## 1. 名称
`zip` - 打包和压缩文件集

## 2. 语法
`zip [-aABcdDeEfFghjklLmoqrRSTuvVwXyz!@$] [--longoption ...]  [-b path] [-n suffixes] [-t date] [-tt date] [zipfile [file ...]]  [-xi list]`  
   
`zipcloak` (详情见[zipcload](zipcloak.md))  
   
`zipnote` (详情见[zipnote](zipnote.md))  
   
`zipsplit` (详情见[zipsplit](zipsplit.md))  
   
## 3. 描述
`zip`是一个用于打包和压缩文件的工具. 支持所有常见的操作系统. 它和Unix的`[tar](tar.md), compress`命令有这类色的功能, 并且与`PKZIP`(MSDOS系统使用)兼容.  
  
`zip`与`[unzip](unzip.md)`是一个组合, 分别用于压缩和解压缩. 这两个命令也可以作用于使用`PKZIP`压缩成的文件上, 相同的`PKZIP`和`PKUNZIP`也可以对`zip`压缩的文件进行操作. 另外如果安装了`bzip2`相关的库的话, `zip`可以支持`bzip2`格式的压缩.  
  
可以在[示例](#示例)部分查看常见的zip使用方式.  
  
**关于大型文件和`Zip64`**. 对于将超过4GB的文件添加进压缩包时, 或者压缩包中存在使用`Zip64`打包的项目, 或者压缩包的大小超过了4GB时, 或者需要压缩的文件数量超过了64K, `zip`会自动使用`Zip64`扩展程序进行压缩. 另外对于通过标准输入流传输的文件进行压缩时, 也会自动使用`Zip64`. 因为无法提前的值标准输入流传输来的文件大小. 但是可以使用`-fz-`选项强制要求`zip`使用`PKZIP`对文件进行压缩.  
   
如果想要获得`zip`或者`unzip`的简要帮助说明, 可以直接通过在命令行上执行这两个命令并且不带任何的参数.

## 4. 使用
该命令在压缩文件集来节省磁盘空间时非常有用.  
  
`zip`命令也可以将一个或者多个压缩文件打包到一个`zip`文件中, 并保留着这些文件的相关信息(名称, 路径, 数据, 上次的修改时间, 安全信息和用于校验完整性的信息). 可以通过一个命令将一个完整的目录打包到`zip`文件中.  
  
**命令的格式**. 基本的命令格式为:  
  
&#8195;`zip 选项 zip文件名 需要打包的文件1 文件2 ...`  
  
其中`zip文件名`是一个新的或者已存在的zip文件, `需要打包的文件`可以是一个目录或者一个文件. 当`zip文件名`是一个已存在的zip文件, 并且`需要打包的文件`已存在于这个文件中(拥有相同的路径), `zip`将会替换原有的文件.   
  
例如`foo.zip`中已包含了文件`foo/file1`和`foo/file2`, 并且目录`foo`中包含文件`foo/file1`和`foo/file3`, 那么:  
  
&#8195;`zip -r foo.zip foo`  
  
或者更加简短的写法:  
  
&#8195;`zip -r foo foo`  
  
将会替换`foo.zip`中的`foo/file1`并且将`foo/file3`添加进`foo.zip`中. 在操作完成后, `foo.zip`中会包含`foo/file1`, `foo/file2`和`foo/file3`, 其中的`foo/file2`和之前的没有任何变化.

使用zip格式的文件压缩
格式:zip 选项 压缩包名 需要压缩的文集序列

#常用选项
-m		#压缩完成有删除源文件
-r		#需要压缩的是一个目录
-j		#忽略子目录内容
-n 文件		#选择不需要压缩的文件(忽略他们)
-y		#不要压缩链接文件的源文件
-数字		#设置压缩率(1-9,9为最高压缩率)

#注意
1.zip与gz的区别
zip在处理文本文件处理方面优越
gz在处理二进制文件处理方面优越
2.-n选项的后面如果有多种格式,将每种格式之间使用:分隔

#示例
#zip后面接压缩后的文件名，在它后面输入要压缩的文件
zip file.zip *			
zip file.zip aaa bbb ccc	#将多个文件压缩到同一包中
#将a.txt压缩为file.zip文件并在压缩完成后删除源文件
zip -m file.zip a.txt
zip -r file.zip *		#将当前目录下的子目录一起压缩
zip -j file.zip *		#忽略子目录的内容
zip -n .jpg: .gif:.mpg		#将以压缩的文件或者没必要压缩的文件去掉
zip -y file.zip *		#不要压缩链接文件的原文件
zip -3 file.zip *		#按照3的压缩率压缩指定文件


-------------------------------------------------------------------
#解压缩文件夹
格式:unzip 压缩包

#常用选项
-Z		#显示压缩包内容
-l		#同上
-v		#同上

#示例
unzip file.zip			#解压目标文件
unzip -Z file.zip
unzip -l file.zip
unzip -v file.zip
