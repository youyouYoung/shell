# useradd
## 1. 名称
`useradd` - 创建一个新账户或者更新新账户的默认信息

## 2. 语法
`useradd [选项] 用户名`  
`useradd -D`   
`useradd -D [选项]`

## 3. 描述
`useradd`是一个低等级的添加新账户的工具. `Debian`系统中管理员应该使用`adduser`去增加账户.   

当在调用`useradd`并且不使用`-D`选项时, `useradd`会使用命令行上输入的值和默认值一起创建新一个新账户. 根据命令行上使用的选项, `useradd`会更新系统文件并且会创建新的用户home路径.   

默认情况下, 为了这个新账号, 一个新的用户组会被创建出来. (详细可查看 `-g, -N, -U`和`USERGROUPS_ENAB`)

## 4. 选项
* -b, --base-dir BASE_DIR
  - 如果`-d HOME_DIR`没有指定的话, 使用这个选项设置系统的基础目录. 结合`BASE_DIR`和账户名来定义账号的home目录.
  - 如果`-m`选项没有使用的话, `BASE_DIR`必须存在.
  - 如果没有使用这个选项, `useradd`将会使用`/etc/default/useradd`文件中的`HOME`变量作为基础目录. 默认为`/home`.
* -c, --comment COMMENT
  - COMMENT可以是任何的文本信息. 这将会作为登录时的简短的描述信息. 目前常被用来保存用户的全名.
* -d, --home-dir HOME_DIR
    - 创建的新用户将会使用`HOME_DIR`作为账号的登录路径. 默认的`HOME_DIR`是通过结合`BASE_DIR`和账户名来作为用户的登录路径.
    - 如果`HOME_DIR`不存在时, 系统会自动创建.
* -D, --defaults
  - 详细信息, 请查看[修改默认值](#41-修改默认值)的部分.
* -e, --expiredate EXPIRE_DATE
  - 设置一个过期时间`EXPIRE_DATE`, 用户将在这一天后过期. 日期的格式为`YYYY-MM-DD`.
  - 如果没有配置过期时间, `useradd`会使用默认的过期时间. 默认的过期时间被设置在`/etc/default/useradd`文件的`EXPIRE`变量中, 或者使用空字符串(没有过期时间).
* -f, --inactive INACTIVE
  - 设置一个天数, 当密码过期了指定天数之后账号将永久禁用. `0`代表一旦密码过期账号立马被禁用, `-1`代表不使用禁用账户的功能.
  - 如果没有设置`INACTIVE`的话, `useradd`会将天数设置为`/etc/default/useradd`文件中的`INACTIVE`变量, 或者是使用默认值`-1`.
* -g, --gid GROUP
  - 设置用户的登录用户组名称或者用户组id. 这个组名称或者id必须已存在.
  - 如果没有使用这个选项, `useradd`会根据`/etc/login.defs`中的`USERGROUPS_ENAB`来执行. 如果`USERGROUPS_ENAB`的值为`yes`, 一个新的用户组将会被创建, 新的组名和账户名相同. 如果值为`no`, `useradd`会将`/etc/default/useradd`文件中的`GROUP`变量的值设置为这个账号的主用户组.
* -G, --groups GROUP1[,GROUP2,...[,GROUPN]]
  - 将用户添加导致这些组中. 每个组的组名使用`,`分隔, 组名之间不能使用空格.
* -k, --skel SKEL_DIR
  - 设置一个`skeleton`目录, 在账户的home目录被创建后, 将这个目录下的所有文件和文件夹都复制到用户的home目录下.
  - 只有当使用了`-m`或者`--create-home`选项之后这个选项才有效.
  - 如果这个选项没有被指定, 那么`skeleton`目录将会使用定义在`/etc/default/useradd`文件中的`SKEL`变量. 默认值为`/etc/skel`.
* -K, --key KEY=VALUE
  - 覆盖`/etc/login.defs`中的默认值. (`UID_MIN`, `UID_MAX`, `UMASK`, `PASS_MAX_DAYS` 和其他参数)
    - 示例: `-K PASS_MAX_DAYS=-1`用来在创建用户时关闭密码的过期限制, 即使账户没有密码. 可以多次使用`-K`参数, 例如: `-K UID_MIN=100 -K UID_MAX=499`
* -m, --create-home
  - 如果账户的home目录不存在时, 自动创建该路径. 在`skeleton`路径下的所有文件和文件夹将会被复制到这个账户的home路径下.
  - 默认情况下, 如果不使用这个选项, 并且`CREATE_HOME`变量(`/etc/login.defs`)没有启用, 将不会为用户创建home目录.
* -M, --no-create-home
  - 不给用户创建home目录, 即使`CREATE_HOME`变量(`/etc/login.defs`)被设置为`yes`.
* -N, --no-user-group
  - 不为账户创建与账户名称相同的用户组, 而是将用户添加到`-g`选项指定的用户组中去. 如果`-g`也没有指定, 则使用`/etc/default/useradd`中的`GROUP`变量.
* -p, --password PASSWORD
  - 设置加密的密码, 默认情况下禁用这个密码.
  - **注意**: 这个选项不被推荐使用, 因为其他的用户可以通过查看进程的方式看到传入的密码.
* -r, --system
  - 创建一个系统账号.
  - 系统账号不会配置`/etc/shadow`中的过期信息. 用户id会从`SYS_UID_MIN-SYS_UID_MAX`范围中选择, 而不是`UID_MIN-UID_MAX`. (`/etc/login.defs`)
  - `useradd`将不会为用户创建home目录, 即使在配置(`/etc/login.defs` (`CREATE_HOME`))启用的情况下. 如果需要为系统用户创建home目录, 可以通过指定`-m`选项的方式实现.
* -s, --shell SHELL
  - 设置账户的登录shell. 默认情况下不会设置这个选项, 这样系统会使用默认的登录shell给这个账号. 系统默认的登录shell被设置在`/etc/default/useradd`的`SHELL`变量中.
* -u, --uid UID
  - 为账户设置uid. 这个值必须是唯一的, 除非使用`-o`选项来规定uid可以不唯一. `UID`必须是非负数.
  - 默认情况下使用大于`UID_MIN`的最小值.
* -U, --user-group
  - 创建一个和账户名相同的用户组, 并将账户添加到这个组中.
### 4.1 修改默认值
* -b, --base-dir BASE_DIR
  - `BASE_DIR`是用户home目录的前缀. 如果没有使用`-d`选项时, 将账户名添加到`BASE_DIR`之后来组成用户的home目录.
  - 这个选项将会设置`/etc/default/useradd`的`HOME`变量.
* -e, --expiredate EXPIRE_DATE
  - 在`EXPIRE_DATE`时账号将被禁用.
  - 这个选项将会设置`/etc/default/useradd`的`EXPIRE`变量.
* -f, --inactive INACTIVE
  - 设置密码过期之后禁用账户的天数.
  - 这个选项将会设置`/etc/default/useradd`的`INACTIVE`变量.
* -g, --gid GROUP
  - 设置新账户初始化的用户组名称或者组id. 这个组名称或者id必须已存在.
  - 这个选项将会设置`/etc/default/useradd`的`GROUP`变量.
* -s, --shell SHELL
  - 设置用户的登录shell.
  - 这个选项将会设置`/etc/default/useradd`的`SHELL`变量.

## 5. 相关配置
一下配置参数都保存在`/etc/login.defs`文件中.  
* `CREATE_HOME` (boolean)
  - 标识默认情况下是否为用户创建home目录.
  - 这个设置不会应用在系统用户上, 但是可以通过命令行参数为系统用户创建home目录.
* `GID_MAX` (number), `GID_MIN` (number)
  - 指定用于创建用户组id的范围.
* `HOME_MOD` (number)
  - 规定新账户home目录的权限. 如果没有指定的话, `UMASK`的值会被用来作为home的权限.
  - `useradd`和`newusers`使用这个参数设置home目录的权限.
* `PASS_MAX_DAYS` (number)
  - 密码最久可以使用的天数. 如果当前密码的使用时长超过了这个天数, 会强制要求修改密码. 如果没有指定的话, -1会被作为默认项.(-1代表禁用密码过期功能.)
* `PASS_MIN_DAYS` (number)
  - 设置修改密码的最短天数. 任何的关于密码的修改如果两次修改之间的时间小于指定的时间, 密码修改操作将会被拒绝. 如果没有指定的话, -1会被作为默认项.(-1代表禁用这个功能.)
* `PASS_WARN_AGE` (number)
  - 设置一个天数, 在密码过期前的指定天数为账户发送警告. 0表示只有在密码过期的当天发送警告, 负数表示不会发送警告. 如果没有指定的话, 不会发送警告.
* `SYS_UID_MAX` (number), `SYS_UID_MIN` (number)
  - 为`useradd`和`newusers`创建系统用户设置系统用户id的范围.
* `UID_MAX` (number), `UID_MIN` (number)
  - 为`useradd`和`newusers`创建登录账户的用户id范围.
* `UMASK` (number)
  - 设置文件创建时的权限. 如果没有指定的话, 这个权限会被设置为022.
  - 如果没有设置`HOME_MOD`, `useradd`和`newusers`会使用这个参数的值为账户的home目录设置权限.
* `USERGROUPS_ENAB` (boolean)
  - 如果值为yes, `userdel`会在删除账户时删除对应的用户组, 如果这个组中没有其他的账户. `useradd`会为账户创建一个同名的用户组.

## 6. 相关文件
* `/etc/passwd`
  - 保存账号信息的文件  
* `/etc/shadow`
  - 保存账号信息的文件, 去除了密码的部分.
* `/etc/group`
  - 保存组信息的文件  
* `/etc/login.defs`
  - 用户, 密码配置信息保存的文件 
* `/etc/skel/`
  - 保存默认文件的目录, 在创建用户时会将这个目录下的所有文件复制到用户home路径下.

## 7. 返回值
|返回值|含义|
| --- | --- |
| 0  | 执行成功  |
| 1  | 无法更新密码文件  |
| 2  | 使用命令的语法出错  |
| 3  | 选项输入的参数错误  |
| 4  | UID已存在  |
| 6  | 指定的用户组不存在  |
| 9  | 用户名被占用  |
| 10  | 无法更新用户组文件信息  |
| 12  | 无法创建账户的home目录  |

## 8. 示例
``` shell
useradd -g groupName userName #添加用户到指定的组中 
cat /etc/passwd #查询系统中所有的用户

#add sudo right for user xi
cd /etc/sudo.d/
touch xi
xi ALL=(ALL)ALL>xi
```
