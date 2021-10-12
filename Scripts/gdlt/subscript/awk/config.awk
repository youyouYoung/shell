## 用于读取配置文件, 将文件信息保存在数组中. 数组属于一个多维数组, 保存有服务器信息, 项目信息.
## 配置文件采用xml格式写成. 样式:<标签名称a>标签值</标签名称a>

## 缺陷
## 1. 无法识别同一行都多个标签信息的文件. 如<a>sd</a><b>....(b标签出现在任何位置都有问题) 可以通过对GetContentInfo中的三个正则表达式进行循环来解决这个问题

## 变量说明
## _rc_final 最终得到的数据集
## _rc_unbalancedTitle 所有没找到结束标签的标签名. 结构:[放入顺序, 标签名]
## _rc_utIndex 上面数组当前索引位置, 由1开始.
## _rc_labelInfo record中提取到的标签信息
## _rc_tempValue 临时存储的标签值

@include "log.awk"

## 跳过纯注释行或者空白航
/^[[:blank:]]*<\!-+/ || /^[[:blank:]]*$/ { next }

{
	gsub(/<\!-+.*$/, "") ## 去除注释

	GetContentInfo($0, _rc_labelInfo)
	if ("start" in _rc_labelInfo) {
		_rc_unbalancedTitle[++_rc_utIndex] = _rc_labelInfo["start"]
		MakeParentMark() ## 为未配平标签数组中当前标签以前的标签贴上父标签的标识

		if (_rc_tempValue) { ## 临时标签值不为空
			LogMark("Error: [**config.awk**] 文件["FILENAME"]在行["FNR"]位置附近有语法错误! 错误原因: 在标签<"_rc_labelInfo["start"]">的父标签中存在标签值.")
			SomethingWrong()
		}
	}

	if ("value" in _rc_labelInfo)
		_rc_tempValue = _rc_labelInfo["value"]

	if ("end" in _rc_labelInfo)
		MeetEndTitle(_rc_utIndex, _rc_labelInfo["end"], _rc_tempValue)
}

function GetContentInfo(_gci_content, _gci_result,      _gci_start_regex, _gci_value_regex, _gci_end_regex, _gci_array) {
	ClearArray(_gci_result)

	_gci_start_regex = "<([^/>]+)>"
        match(_gci_content, _gci_start_regex, _gci_array)
        if (1 in _gci_array) {
                _gci_result["start"] = _gci_array[1]
                _gci_content = substr(_gci_content, _gci_array[0, "start"]+_gci_array[0, "length"])
        }

        _gci_value_regex = "[[:blank:]]*([^< \\t]*)[[:blank:]]*"
        match(_gci_content, _gci_value_regex, _gci_array)
        if (1 in _gci_array) {
                _gci_result["value"] = _gci_array[1]
                _gci_content = substr(_gci_content, _gci_array[0, "start"]+_gci_array[0, "length"])
        }

        _gci_end_regex = "</([^/>]+)>"
        match(_gci_content, _gci_end_regex, _gci_array)
        if (1 in _gci_array) {
                _gci_result["end"] = _gci_array[1]
        }
}

## 纪录中出现终止标签时, 调用此函数
## _met_ubcIndex 未配平标签数组最后一个元素的下标
## _met_endTitle 终止标签的标签名
## _met_value 标签的值
## _met_indice 函数内部变量, 用于生成最终数组的下标
## _met_position 遍历数组使用的索引
function MeetEndTitle(_met_ubcIndex, _met_endTitle, _met_value,           _met_indice, _met_position) {
	if (!_met_ubcIndex || _rc_unbalancedTitle[_met_ubcIndex] != _met_endTitle) { ## 未配平数组中没有元素, 或者最后一个元素的值和结束标签不一致
		LogMark("Error: [**config.awk**] 文件["FILENAME"]在行["FNR"]位置附近有语法错误! 错误原因: 没有找到结束标签</"_met_endTitle">的开始标签.")
		SomethingWrong()
	}

	## 标签值为空
	if (!_met_value) {
		## 如果是父标签, 直接跳过.
		if (_rc_unbalancedTitle[_met_ubcIndex, "parent"]) {
			Pop() ## 以配平标签出栈
			return
		}

		## 不是父标签的标签没有标签值, 则发出警告
		LogMark("Warning: [**config.awk**] 文件["FILENAME"]在行["FNR"]位置附近对于标签<"_met_endTitle">没有指定值.")
	}

	## 为父标签设置唯一值标识, 即父标签的第一个子标签的值
	if (!(_met_ubcIndex-1 SUBSEP "inditifyValue" in _rc_unbalancedTitle)) _rc_unbalancedTitle[_met_ubcIndex-1, "inditifyValue"] = _met_value

	## 计算结果数组中保存数据的索引值
	for (_met_position = 1; _met_position <= _met_ubcIndex; _met_position++) {
		_met_indice = (_met_indice ? _met_indice SUBSEP : "")_rc_unbalancedTitle[_met_position](_rc_unbalancedTitle[_met_position, "parent"] ? SUBSEP _rc_unbalancedTitle[_met_position, "inditifyValue"] : "")
	}

	## 已配平标签出栈
	Pop()

	_rc_final[_met_indice] = _met_value ## 保存数据
	_rc_tempValue = "" ## 清除临时标签值
}

## 给未配平的标签数组中除最后一个元素以外的元素添加父标签属性
## _mpm_position 遍历数组使用的索引
function MakeParentMark(           _mpm_position) {
	_mpm_position = _rc_utIndex-1
	while (_mpm_position in _rc_unbalancedTitle && !_rc_unbalancedTitle[_mpm_position SUBSEP "parent"]) {
		_rc_unbalancedTitle[_mpm_position, "parent"] = 1 ## 父标签属性置为真
		_mpm_position--
	}
}

## 清除数组内容
## _ca_array 目标数组
## _ca_position 遍历数组使用的索引
function ClearArray(_ca_array,         _ca_position) {
	for (_ca_position in _ca_array) 
		delete _ca_array[_ca_position]
}

## 对未配平标签数组进行出栈
function Pop() {
	delete _rc_unbalancedTitle[_rc_utIndex]
	delete _rc_unbalancedTitle[_rc_utIndex, "parent"]
	delete _rc_unbalancedTitle[_rc_utIndex, "inditifyValue"]
	_rc_utIndex--
}

## 出现错误, 程序退出
function SomethingWrong() {
	_rc_haserror = 1
	exit 1
}
