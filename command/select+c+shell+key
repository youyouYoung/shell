#select是shell脚本中一种流程控制命令.select具有选择和循环的双重性质.
select 选项变量 in 匹配串
do
	命令
done

#注意
其功能如下:
1.select会为匹配串的各选项编号,从1开始递增.
2.使用者键入编号.
3.对应编号的内容给选项变量,编号值放在REPLY中.
4.循环读入用户输入

#示例
cnt=(ls -A)
select var in $cnt
do
	echo sa
done
