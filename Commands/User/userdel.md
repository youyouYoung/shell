# userdel
## 1. 名称
`userdel` - 删除账户和相关的文件

## 2. 语法
`userdel [选项] 用户名`

## 3. 描述
`userdel`是一个低等级的删除账户的工具. `Debian`系统中管理员应该使用`deluser`去删除用户.  
`userdel`命令会修改系统保存账户的文件, 删除一切关于`用户名`(执行命令时提供)的内容, 所以`用户名`必须存在.

## 4. 选项
* -f, --force
  - 这个选项会强制删除账号信息, 即使用户在登录状态中. 同时也会强制删除用户的home目录, 即使有其他的用户正在访问这个路径.
  - 如果`/etc/login.defs`文件中的`USERGROUPS_ENAB`被设置为`yes`时, 如果存在一个组和`用户名`相同, 这个组也会被删除. 即使这个组同时也是其他用户的主组.
* -r, --remove
  - 在用户home路径下的文件会被删除. 但是属于需要被删除的用户但是保存在其他路径下的文件需要手动去删除.

## 5. 相关配置
以下的配置参数都保存在`/etc/login.defs`文件中.  
* `MAX_MEMBERS_PER_GROUP` (number)
  - 每组最多可容纳的用户数量. 默认是0, 表示没有上限.  
* `USERDEL_CMD` (string)
  - 如果定义了这个参数, 那么将使用定义的方法执行删除账户的操作. 方法中应该包含删除`/cron/print`中关于的功能. `用户名`可以通过第一个参数获取.
  - 这里有一个示例用来实现删除并输出用户的定时任务.
    ```shell
    #! /bin/sh
  
    # Check for the required argument.
    if [ $# != 1 ]; then
          echo "Usage: $0 username"
          exit 1
    fi
  
    # Remove cron jobs.
    crontab -r -u $1
  
    # Remove at jobs.
    # Note that it will remove any jobs owned by the same UID,
    # even if it was shared by a different username.
    AT_SPOOL_DIR=/var/spool/cron/atjobs
    find $AT_SPOOL_DIR -name "[^.]*" -type f -user $1 -delete \;
    
    # Remove print jobs.
    lprm $1
    
    # All done.
    exit 0
    ```
* `USERGROUPS_ENAB` (boolean)
  - 如果设置为`yes`, 执行删除用户操作时, 会一并删除与`用户名`相同的组.

## 6. 相关文件
* `/etc/group`
  - 保存组信息的文件  
* `/etc/login.defs`
  - 用户, 密码配置信息保存的文件  
* `/etc/passwd`
  - 保存账号信息的文件  
* `/etc/shadow`
  - 保存账号信息的文件, 去除了密码的部分.

## 7. 返回值
|返回值|含义|  
| ------ | ---- |
|0|执行成功|
|1|更新密码文件失败|
|2|使用命令的语法出错|
|6|`用户名`不存在|
|8|`用户名`处于登录状态|
|10|更新用户组文件失败|
|12|删除用户home目录失败|

## 8. 示例
```shell
userdel -r Daniel  	#删除用户及其主目录
```
