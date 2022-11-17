- 命令
	- ```
	  awk '{print $9, $NF}' /tmp/access_use.log.sort | grep  "[0-9][0-9](ms)" |head -n 165
	  
	  awk '{print $9, $NF}' /tmp/access_use.log.sort | grep  "[0-9][0-9](ms)" |head -n 165 | awk '{print $1}' | sort -n  | uniq -c | sort -nr -k1
	  ```
-
- demo1
	- # game 生成相关函数
	  grep "0x03" proto/cmd/cmd.proto  | grep "Event" | awk '{printf"\nfunc %s%s(user *User, in *serverproto.CommonRequest) error {\n\treq := &networkproto.%s{}\n\tif err := log.UnmarshalProto(in, req); err != nil {\n\t\treturn err\n\t}\n\n\t_ = req;\n\t// TODO\n\treturn nil\n}\n",tolower(substr($1,1,1)),substr($1,2),$6}'
	  # game 调用代码生成
	  grep "0x03" proto/cmd/cmd.proto  | grep "Event" | awk '{printf"\tcase cmdproto.GameSerCmd_%s: // %s\n\t\terr = %s%s(user, in)\n", $1,$5,tolower(substr($1,1,1)),substr($1,2)}'