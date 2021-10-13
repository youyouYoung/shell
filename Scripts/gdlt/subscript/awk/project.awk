@include "config.awk"

BEGIN {
	if (!project) {
		LogMark("Error: [**project.awk**] 通过awk读取配置文件时, 没有指定需要服务器中的目标项目.")
		SomethingWrong()
	}
}

## 项目信息
END {
	if (_rc_haserror) exit 1
	
	if ("project" SUBSEP project SUBSEP "resource" in _rc_final)
		printf "%s=%s\n", "_project_resource_basepath", _rc_final["project", project, "resource"]
	else {
		LogMark("Error: [**project.awk**] 通过awk读取项目信息时, 没有找到项目["project"]资源文件根目录.")
		SomethingWrong()
	}


	for (i = 1; "project" SUBSEP project SUBSEP "static" SUBSEP i SUBSEP "source" in _rc_final; i++) {
		if (!_rc_final["project", project, "static", i, "source"] || !_rc_final["project", project, "static", i, "target"]) continue ## 源文件地址和目标地址任意一个为空, 则跳过
		static_source = _rc_final["project", project, "static", i, "source"] ":" static_source
		static_target = _rc_final["project", project, "static", i, "target"] ":" static_target
	}
	if (static_target) { ## static_target不为空
		printf "%s=%s\n", "_project_static_source", static_source
		printf "%s=%s\n", "_project_static_target", static_target
	}


	for (i = 1; "project" SUBSEP project SUBSEP "dynamic" SUBSEP i SUBSEP "source" in _rc_final; i++) {
		if (!_rc_final["project", project, "dynamic", i, "source"] || !_rc_final["project", project, "dynamic", i, "target"]) continue ## 源文件地址和目标地址任意一个为空, 则跳过
		dynamic_source = _rc_final["project", project, "dynamic", i, "source"] ":" dynamic_source
		dynamic_target = _rc_final["project", project, "dynamic", i, "target"] ":" dynamic_target
	}
	if (dynamic_target) { ## static_target不为空
		printf "%s=%s\n", "_project_dynamic_source", dynamic_source
		printf "%s=%s\n", "_project_dynamic_target", dynamic_target
	}
}
