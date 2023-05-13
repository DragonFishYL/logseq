- netstat
	- 查询网络并发数
		- ```
		  netstat -anp | grep ESTABLISHED | grep access | wc -l
		  ```
	- 查看系统tcp连接中各个状态的连接数/查看web的并发请求数及其TCP连接状态
		- ```
		  netstat -an | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
		  ```
	- 查看所有建立连接的详细记录
		- ```
		  netstat -nat|grep ESTABLISHED|wc -l
		  netstat -an | grep ESTABLISHED | wc -l
		  ```
	- 查看内存占用最大的进程的命令
		- ```
		  ps aux| grep -v "USER" | sort -n -r -k 4 | awk 'NR==1{ print $0}'
		  ```