- 命令
	- ```
	  awk '{print $9, $NF}' /tmp/access_use.log.sort | grep  "[0-9][0-9](ms)" |head -n 165
	  
	  awk '{print $9, $NF}' /tmp/access_use.log.sort | grep  "[0-9][0-9](ms)" |head -n 165 | awk '{print $1}' | sort -n  | uniq -c | sort -nr -k1
	  ```
-
- 生成代码
	- game 生成相关函数
	  ```
	  grep "0x03" proto/cmd/cmd.proto  | grep "Event" | awk '{printf"\nfunc %s%s(user *User, in *serverproto.CommonRequest) error {\n\treq := &networkproto.%s{}\n\tif err := log.UnmarshalProto(in, req); err != nil {\n\t\treturn err\n\t}\n\n\t_ = req;\n\t// TODO\n\treturn nil\n}\n",tolower(substr($1,1,1)),substr($1,2),$6}'
	  ```
	- game 调用代码生成
	  ```
	   grep "0x03" proto/cmd/cmd.proto  | grep "Event" | awk '{printf"\tcase cmdproto.GameSerCmd_%s: // %s\n\t\terr = %s%s(user, in)\n", $1,$5,tolower(substr($1,1,1)),substr($1,2)}'
	  ```
- 查询日志
	- awk -F "value: " 'BEGIN{sum=0}{gsub(/"/, "",$2); if($2 > 0) sum+=$2; } END{print sum}' /tmp/8880134.log
- 查找game日志中请求时间超过500us的并按照次数排序
	- awk -F' ' '/cmd:/ && /duration:/ { 
	      cmd = $7
	      split($0, arr, "duration:")
	      split(arr[2], durationArr, " ")
	      duration = substr(durationArr[1], 1, length(durationArr[1])-2)
	      base = substr(durationArr[1], length(durationArr[1])-1, 2)
	  	if (base == "ms") {
	          if (duration > 30) {
	              count[cmd]++
	          }
	  	}
	  }
	  END {
	      for (cmd in count) {
	          print "cmd: " cmd ", duration > 30ms count: " count[cmd]
	      }
	  }' logs/game.log | sort -k7nr -t':' -k3n
- 根据错误日志去重并输出
	- awk '{for(i=1;i<=3;i++){$i=""};print $0}' ./access_err.log | sort -n | uniq -c
- 将日志按时间排序
	- ```
	  awk -F"time=" 'BEGIN{OFS=FS} {gsub(/"/, "", $2); print $0, $2}' /tmp/1000110.log | sort -t'"' -k2,2 > /tmp/1000110.log
	  ```
- game日志按照cmd去重并统计其出现的次数
	- ```
	  awk '{
	    if (match($0, /cmd: ([^ ]+) ([^ ]+) flow/, cmd)) {
	      command = substr($0, RSTART+5, RLENGTH-9);
	      count[command]++;
	      if (count[command] == 1) {
	        uniqueCommands[++uniqueCount] = command;
	      }
	    }
	  }
	  END {
	    for (i = 1; i <= uniqueCount; i++) {
	      print uniqueCommands[i], count[uniqueCommands[i]];
	    }
	  }' /tmp/game_error.log
	  ```
-