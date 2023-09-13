- 命令
	- ```
	  awk '{print $9, $NF}' /tmp/access_use.log.sort | grep  "[0-9][0-9](ms)" |head -n 165
	  
	  awk '{print $9, $NF}' /tmp/access_use.log.sort | grep  "[0-9][0-9](ms)" |head -n 165 | awk '{print $1}' | sort -n  | uniq -c | sort -nr -k1
	  ```
-
- demo1
	- # game 生成相关函数
	  ```
	  ```
# game 调用代码生成
 grep "0x03" proto/cmd/cmd.proto  | grep "Event" | awk '{printf"\tcase cmdproto.GameSerCmd_%s: // %s\n\t\terr = %s%s(user, in)\n", $1,$5,tolower(substr($1,1,1)),substr($1,2)}'
- 查询日志
	- ![image.png](../assets/image_1670925500406_0.png)
		- // 以“value: ”分割的第二个字段使用gsub匹配双引号为空,然后对大于零的数求和
		  ```
		  awk -F "value: " 'BEGIN{sum=0}{gsub(/"/, "",$2); if($2 > 0) sum+=$2; } END{print sum}' /tmp/8880134.log
		  ```
- 查找game日志中请求时间超过500us的并按照次数排序
	- ```
	  awk -F' ' '/cmd:/ && /duration:/ { 
	      cmd = $7
	      split($0, arr, "duration:")
	      split(arr[2], durationArr, " ")
	      duration = substr(durationArr[1], 1, length(durationArr[1])-2)
	      base = substr(durationArr[1], length(durationArr[1])-1, 2)
	  	if (base == "ms") {
	  		duration *= 1000
	  	}
	  	
	      if (duration > 500) {
	          count[cmd]++
	      }
	  }
	  END {
	      for (cmd in count) {
	          print "cmd: " cmd ", duration > 500us count: " count[cmd]
	      }
	  }' logs/game.log | sort -k7nr -t'