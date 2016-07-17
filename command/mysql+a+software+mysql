启动和停止mysql服务
	sudo start mysql #手动的话这样启动
	sudo stop mysql #手动停止

数据文件存放路径 
	datadir         = /var/lib/mysql

登录
	mysql -u root -p 

数据库备份命令：
1.mysqldump -u root -p Test > Test.bak
yang303011
2.mysqldump -u root -pYang303011 Test > Test.bak

数据库恢复命令：
mysql -u root -p test < date.bak
yang303011
前提是mysql中必须先创建一个叫做test的空数据库
也可以是mysql -u root -pYang303011 test < date.bak

查看表结构：
desc tableName;

连接mysql数据库时要将mysql的驱动存放在jdk下/jre/lib/ext


// mysql的数据库存放路径
/var/lib/mysql


//从mysql中导出和导入数据
mysqldump 数据库名 > 文件名 #导出数据库
mysqladmin create 数据库名 #建立数据库
mysql 数据库名 < 文件名 #导入数据库


//忘了mysql的root口令怎么办
sudo /etc/init.d/mysql stop
sudo mysqld_safe --skip-grant-tables &
sudo mysqladmin -u user password 'newpassword
sudo mysqladmin flush-privileges

//修改mysql的root口令
sudo mysqladmin -u root -p password '你的新密码'


// 如何优化mysql
wget  http://www.day32.com/MySQL/tuning-primer.sh
chmod +x tuning-primer.sh
./tuning-primer.sh

//mysql命令行中文显示?号
mysql> set names utf8;


//常用mysql管理语句
show table status;  #查询表状态
show full processlist;  #查询mysql进程
alter table site_stats engine=MyISAM;   #转换表为MyISAM类型，转表锁为行锁。
show variables;  ＃查看mysql 变量


//mysql的自动备份
#备份 forum myweb 数据库到 /backup/mysql 目录，并删除7天之前的备份记录
mysqldump --opt --skip-lock-tables -u root forum | gzip -9 > /backup/mysql/forum.`date +%Y%m%d`.sql.gz
mysqldump --opt --skip-lock-tables -u root myweb | gzip -9 > /backup/mysql/myweb.`date +%Y%m%d`.sql.gz
find /backup/mysql/ -type f -ctime +7 -exec rm {} \;


mysqladmin  Ver 8.42 Distrib 5.5.41, for debian-linux-gnu on x86_64
Copyright (c) 2000, 2014, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Administration program for the mysqld daemon.
Usage: mysqladmin [OPTIONS] command command....
  -c, --count=#       Number of iterations to make. This works with -i
                      (--sleep) only.
  --debug-check       Check memory and open file usage at exit.
  --debug-info        Print some debug info at exit.
  -f, --force         Don't ask for confirmation on drop database; with
                      multiple commands, continue even if an error occurs.
  -C, --compress      Use compression in server/client protocol.
  --character-sets-dir=name 
                      Directory for character set files.
  --default-character-set=name 
                      Set the default character set.
  -?, --help          Display this help and exit.
  -h, --host=name     Connect to host.
  -b, --no-beep       Turn off beep on error.
  -p, --password[=name] 
                      Password to use when connecting to server. If password is
                      not given it's asked from the tty.
  -P, --port=#        Port number to use for connection or 0 for default to, in
                      order of preference, my.cnf, $MYSQL_TCP_PORT,
                      /etc/services, built-in default (3306).
  --protocol=name     The protocol to use for connection (tcp, socket, pipe,
                      memory).
  -r, --relative      Show difference between current and previous values when
                      used with -i. Currently only works with extended-status.
  -s, --silent        Silently exit if one can't connect to server.
  -S, --socket=name   The socket file to use for connection.
  -i, --sleep=#       Execute commands repeatedly with a sleep between.
  --ssl               Enable SSL for connection (automatically enabled with
                      other flags).
  --ssl-ca=name       CA file in PEM format (check OpenSSL docs, implies
                      --ssl).
  --ssl-capath=name   CA directory (check OpenSSL docs, implies --ssl).
  --ssl-cert=name     X509 cert in PEM format (implies --ssl).
  --ssl-cipher=name   SSL cipher to use (implies --ssl).
  --ssl-key=name      X509 key in PEM format (implies --ssl).
  --ssl-verify-server-cert 
                      Verify server's "Common Name" in its cert against
                      hostname used when connecting. This option is disabled by
                      default.
  -u, --user=name     User for login if not current user.
  -v, --verbose       Write more information.
  -V, --version       Output version information and exit.
  -E, --vertical      Print output vertically. Is similar to --relative, but
                      prints output vertically.
  -w, --wait[=#]      Wait and retry if connection is down.
  --connect-timeout=# 
  --shutdown-timeout=# 
  --plugin-dir=name   Directory for client-side plugins.
  --default-auth=name Default authentication client-side plugin to use.
  --enable-cleartext-plugin 
                      Enable/disable the clear text authentication plugin.

Variables (--variable-name=value)
and boolean options {FALSE|TRUE}  Value (after reading options)
--------------------------------- ----------------------------------------
count                             0
debug-check                       FALSE
debug-info                        FALSE
force                             FALSE
compress                          FALSE
character-sets-dir                (No default value)
default-character-set             auto
host                              (No default value)
no-beep                           FALSE
port                              3306
relative                          FALSE
socket                            /var/run/mysqld/mysqld.sock
sleep                             0
ssl                               FALSE
ssl-ca                            (No default value)
ssl-capath                        (No default value)
ssl-cert                          (No default value)
ssl-cipher                        (No default value)
ssl-key                           (No default value)
ssl-verify-server-cert            FALSE
user                              (No default value)
verbose                           FALSE
vertical                          FALSE
connect-timeout                   43200
shutdown-timeout                  3600
plugin-dir                        (No default value)
default-auth                      (No default value)
enable-cleartext-plugin           FALSE

Default options are read from the following files in the given order:
/etc/my.cnf /etc/mysql/my.cnf /usr/etc/my.cnf ~/.my.cnf 
The following groups are read: mysqladmin client
The following options may be given as the first argument:
--print-defaults        Print the program argument list and exit.
--no-defaults           Don't read default options from any option file.
--defaults-file=#       Only read default options from the given file #.
--defaults-extra-file=# Read this file after the global files are read.

Where command is a one or more of: (Commands may be shortened)
  create databasename	Create a new database
  debug			Instruct server to write debug information to log
  drop databasename	Delete a database and all its tables
  extended-status       Gives an extended status message from the server
  flush-hosts           Flush all cached hosts
  flush-logs            Flush all logs
  flush-status		Clear status variables
  flush-tables          Flush all tables
  flush-threads         Flush the thread cache
  flush-privileges      Reload grant tables (same as reload)
  kill id,id,...	Kill mysql threads
  password [new-password] Change old password to new-password in current format
  old-password [new-password] Change old password to new-password in old format
  ping			Check if mysqld is alive
  processlist		Show list of active threads in server
  reload		Reload grant tables
  refresh		Flush all tables and close and open logfiles
  shutdown		Take server down
  status		Gives a short status message from the server
  start-slave		Start slave
  stop-slave		Stop slave
  variables             Prints variables available
  version		Get version info from server
