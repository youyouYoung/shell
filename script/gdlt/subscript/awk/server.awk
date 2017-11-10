@include "config.awk"

BEGIN {
	if (!server) {
		LogMark("Error: [**server.awk**] 通过awk读取配置文件时, 没有指定需要查找的服务器名称.")
		SomethingWrong()
	}

	if (!project) {
		LogMark("Error: [**server.awk**] 通过awk读取配置文件时, 没有指定需要服务器中的目标项目.")
		SomethingWrong()
	}
}

## 服务器信息
END {
	if (_rc_haserror) exit 1
	
	if ("server" SUBSEP server SUBSEP "ip" in _rc_final)
		printf "%s=%s\n", "_server_ip", _rc_final["server", server, "ip"]

	if ("server" SUBSEP server SUBSEP "webserver" SUBSEP project SUBSEP "project" in _rc_final) {
		printf "%s=%s\n", "_server_path", _rc_final["server", server, "webserver", project, "path"]
		printf "%s=%s\n", "_server_log", _rc_final["server", server, "webserver", project, "log"]
	}
	else if ("server" SUBSEP server SUBSEP "webserver" SUBSEP "*" SUBSEP "project" in _rc_final) {
		printf "%s=%s\n", "_server_path", _rc_final["server", server, "webserver", "*", "path"]
		printf "%s=%s\n", "_server_log", _rc_final["server", server, "webserver", "*", "log"]
	}
	else {
		LogMark("Error: [**server.awk**] 通过awk读取服务器信息时, 没有找到服务器["server"]下关于项目["project"]的位置和日志信息.")
		SomethingWrong()
	}
}
