#用于对GConf系统进行配置和管理.
gconftool-2 选项 选项参数

#常用选项
--all-dirs
列出指定目录中的所有子目录。 

--all-entries
显示指定目录中所有键的值.

--config-source= configuration-source
将此选项与 --direct 选项一起使用可指定要使用的配置源。如果不用此选项指定配置源，将对路径文件中的所有配置源运行该命令。

--direct
将此选项与 --config-source 选项一起使用可直接访问配置源。当您使用此选项时，GConf 将绕过服务器。在您使用此选项前，请确保 GConf 守护程序 gconfd-2 不在运行。

--dump
生成一个包含您指定的 GConf 信息库目录中的所有首选项键的列表。该列表包含所有键的 XML 描述。该列表包含在 <gconfentryfile> 元素中。
例如，您可以从这个选项重定向输出以生成一个文件，其中列出与您的面板配置有关的所有键。可以把 --load 选项用于此文件。

--get
显示指定首选项键的值。还显示架构对象中用于指定架构键的元素的值。 

--help
显示关于 gconftool-2 命令的帮助消息，以及可以和 gconftool-2 命令一起使用的选项。

--load=filename
使用这个选项可以将配置源中当前目录的首选项键值设置成您所指定的文件中的值。您指定的文件必须在 <gconfentryfile> 元素中包含键的 XML 描述。

--long-desc=description
将此选项与 --set-schema 选项一起使用可为架构键指定详细的说明。

--makefile-install-rule
把架构定义文件安装到应用程序。 

--owner=owner
将此选项与 --set-schema 选项一起使用可为架构键指定所有者。

--recursive-list
显示指定目录中所有子目录的所有首选项键的值。 

--recursive-unset
将目录中所有子目录的所有首选项键的值，从用户设置重置为默认配置源中的设置。 

--set
设置首选项键的值，并将该值写到用户配置源。将 --type 选项与 --set 选项一起使用可指定要设置的值的数据类型。
您还可以将 --direct 选项以及 --config-source 选项与 --set 选项一起使用，向另一个配置源写入值。

--set-schema
设置架构键中属性的值，并将此值写到默认配置源。 
将以下选项与 --set-schema 选项一起使用可指定要更新的属性：--type,--short-desc,--long-desc,--owner

--short-desc=description
将此选项与 --set-schema 选项一起使用可为架构键指定简短说明。

--shutdown
终止 GConf 守护进程。

--type=data-type
设置首选项键的值时，使用此选项指定数据类型。还可以在设置架构键中属性的值时使用此选项。下面列出有效的数据类型： bool,float,int,list,pair,string

--unset
将首选项键的值从用户设置重置为默认配置源中的设置。 

--usage
显示有关 gconftool-2 命令和可以与 gconftool-2 命令一起使用的选项的简短帮助信息。

#注意
1.gconftool-2可以完成:设置键值,显示键值,安装应用程序时从架构定义文件安装架构.

#示例
清除桌面挂载硬盘图标
gconftool-2 --set /apps/nautilus/desktop/volumes_visible 0 --type bool

恢复：
gconftool-2 --set /apps/nautilus/desktop/volumes_visible 1 --type bool

显示 /desktop/gnome 目录和子目录中所有键的值
gconftool-2 --recursive-list /desktop/gnome

设置用户配置源中 /apps/gnome-terminal/profiles/Default/background_color 键的值：
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#000000"

为 /apps/gnome-terminal/profiles/Default/background_color 键设置架构键中的简短描述：
gconftool-2 --set-schema "/schemas/apps/gnome-terminal/profiles/Default/background_color" --short-desc "Default background color of terminal"
