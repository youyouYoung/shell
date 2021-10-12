/--*监控网络状态信息*--/
netstat    //显示网络统计信息linux，windows都用
netstat -an   //按照端口号排序
netstat -p   //显示网络连接信息以及使用某一端口的进程号


netstat：此命令用来显示整个系统目前的网络情况。目前的连接数，数据包传递数据，路由器内容


// 查看路由信息
netstat -rn


// 统计当前IP连接的个数
netstat -na|grep ESTABLISHED|awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c|sort -r -n
netstat -na|grep SYN|awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c|sort -r -n
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n


// 查看网络连接状态
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'


// 察看当前网络连接状况以及程序
sudo netstat -atnp
