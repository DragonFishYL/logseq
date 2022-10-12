-
- 错误及解决方案
	- 错误：Could not execute dot; may need to install graphviz.
	- 解决：需要安装graphviz
		- [graphviz-install-2.44.1-win64.exe](../assets/graphviz-install-2.44.1-win64_1665562461154_0.exe)
		- 安装后添加到环境变量
		  右键管理员身份打开cmd，进入目录：D:\Program Files\Graphviz 2.44.1\bin
		  执行：dot -c
- 调试
	- 生成pprof文件
		- ```
		  // 方法一
		  main函数加入以下两行
		  pprof.StartCPUProfile(os.Stdout)
		  defer pprof.StopCPUProfile()
		  然后执行如下
		  go run main.go > main.pprof
		  
		  // 方法二
		  // -run指定要调试的方法 + 调试方法所依赖的文件 + -cpuprofile + 指定pprof文件
		  go test -bench=. -run=BenchmarkRefreshItemStore$ ./*.go -cpuprofile game.pprof
		  ```
	- 调试pprof文件
		- 命令行终端分析
			- go tool pprof test.go  test.pprof
				- 指定查看前10个
					- top10
				- 按照cum%排序
					- top  --cum%
		- 浏览器分析,随意指定一个端口
			- go tool pprof  -http:9999  test.go  test.pprof