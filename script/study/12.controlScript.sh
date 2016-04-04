#!/bin/bash
#linux中的控制脚本的学习。
#我们运行脚本一般是通过命令行调用，然而我们有其他的方式去调用脚本的执行。

#1.捕捉linux信号：
#linux通过信号来和运行中的进程之间做通信，我们可以通过linux信号来停止、启动、或者终止进程。
#linux信号共有30多种，常见的有：
#信号		值		描述
# 1		SIGHUP		挂起进程
# 2		SIGINT		终止进程
# 3		SIGQUIT		停止进程
# 9		SIGKILL		无条件停止进程
# 15		SIGTERM		可能的话终止进程
# 17		SIGSTOP		无条件停止进程，但不终止进程
# 18		SIGTSTP		停止或暂停进程，但不终止进程
# 19		SIGCONT		继续运行停止中的进程
#
#这些信号的产生：
#1.终止进程：ctrl+c
#2.暂停进程：ctrl+z
#
#通过linux信号控制脚本：捕捉信号
#trap命令允许你指定要观察的linux信号，一旦出现该信号shell将会把他拦截交给本地处理同时你可以执行自己的操作。
#trap格式：trap commands signals
trap echo "this is my response, when you use ctrl+c" SIGINT SIGTERM
#以上会捕捉ctrl+c
echo this is normal output.
trap echo "it's over." EXIT		#捕捉退出信号

#trap也可以移除你设置的捕捉条件。通过格式：trap - signals
trap - EXIT			#移除捕捉退出信号
#所有你在命令行中运行的脚本在此终端被关闭的时候都会随着终端的关闭而停止，因为他们统统属于这个终端下的一个作业

#2.在非控制台上运行脚本
#为了能让在控制台退出时脚本不会一起退出，我们可以通过nohup命令来将脚本运行在非控制台下，其实这意味着脚本会忽略任何终端发来的SIGHUP信号。
#由于脚本和终端解除了关联关系，这样脚本就没有了STDOUT、STDERR。我们需要重新指定脚本的输出和错误位置
#格式：nohup bash 1.base.sh &
#在运行时会显示：nohup: ignoring input and appending output to ‘nohup.out’。他意思是如果没有指定输出文件的话，会将输出和错误默认定向到当前路径下的nohup.out中

#3.调整进程优先级
#linux通过进程优先级来给每一个进程分配cpu的执行时间片。linux的优先级被设置为整数值
#从-20（最高优先级）到+20（最低优先级）。默认情况下bash shell启动的进程的优先级都为0
#3.1 通过nice在启动进程时赋予有该进程指定优先级
#-n选项可以用来指定新的优先级
nice -n 10 ls > output			#将ls命令优先级降低到指定优先级
nice -n -10 ls > output			#将ls命令优先级升高到指定优先级
#在提高优先级是需要管理员权限
#3.2 通过renice给已经创建了的进程新的优先级
#renice允许你指定进程PID来改变进程的优先级，-p选项可以指定PID
renice 10 -p 29381
#renice的限制条件：
#1.只能对属于自己的进程执行renice命令
#2.只能通过renice降低进程的优先级
#3.root用户可以通过renice调整任何进程的优先级到任何程度

#4.定时运行脚本at
#格式：at [-f filename] time
#可以通过at命令来在指定的时间运行一条命令或者脚本。如果没有使用-f选项指定脚本文件的话。at默认会将STDIN作为运行命令
#在创建定时执行命令后，at会将需要执行的命令保存在/var/spool/at中，通过隔一段时间来访问该文件的方式执行定时命令
#time的形式多种多样，用时可以再查
at -f 1.base.sh 23:00
#at会将作业的输出通过email的方式放松到本地，如果没有输出的话默认不发送任何数据
#可以通过acq命令来获取当前创建的定时脚本
#可以通过atrm命令来删除等待中的脚本

#5.计划定时定时执行脚本
#可以将要执行的脚本写在cron时间表中
#使用crontab -l可以列出当前用户的计划任务
#使用crontab -e可以编辑要执行的计划任务
#如果不需要在准确的时间执行的话，可以将计划脚本放在/etc/cron.*ly这几个目录下，他们可以每天、每小时或者每周执行一次你执行的命令
#crontab存在一个问题是如果系统关机，那么原计划的任务将不会执行及时系统在次开机。
#anacron弥补了这一不足，如果脚本没有在计划的时间完成运行的话，那么anacron会尽快运行这一脚本文件。
#但是anacron只会处理位与cron目录（/etc/cron.*ly）的程序。并且不会执行时间需求小于一天的脚本。

#6.开机执行
#ubuntu将开机需要执行的脚本文件放在了/etc/rc#.d（#代表运行级）目录下，此目录下的文件其实质都是链接引自/etc/init.d/目录下
#为了将系统的脚本和管理员的脚本区别开来，ubuntu使用/etc/rc.local文件保存管理员创建并需要在开机时执行的一切脚本

#7.在shell启动时运行，shell在启动时会执行用户主目录下的.bashrc文件
#在退出控制台时会执行.bash_logout文件
