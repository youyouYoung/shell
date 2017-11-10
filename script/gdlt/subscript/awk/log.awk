## 将时间戳转为固定格式的时间
function ConvTime(timestamp,     format) {
	format = "%Y-%m-%d %H:%M:%S"
	if (!timestamp) timestamp = systime()
	return strftime(format, timestamp)
}

function LogMark(content) {
	AWK_LOG = ENVIRON["LOG_BASEPATH"]"/gdlt.log"

	if (!content) return
	printf "%19s --- %s\n", ConvTime(), content >> AWK_LOG
}
