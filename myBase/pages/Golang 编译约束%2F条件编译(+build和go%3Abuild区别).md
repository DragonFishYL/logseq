title:: Golang 编译约束/条件编译(+build和go:build区别)

- 通常对程序进行编译的时候，可能带一些条件（如不同平台、架构有不同的代码实现），让编译器只对满足条件的代码进行编译，将不满足条件的代码舍弃，这就是条件编译。golang中，称之为编译约束，进行编译约束的方式有2种分别：
-
- 另种方式：
	- 编译标签（build tag）
	- 文件后缀
-
- 编译标签（build tag）
	- 在源码文件顶部添加注释，来决定文件是否参与编译
	- ```
	  // +build <tags>
	  ```
	- 说明：
		- 以空格分开表示AND
		- 以逗号分开表示OR
		- !表示NOT
	- 标签可以指定为以下内容：
		- 操作系统，环境变量中GOOS的值，如：linux、darwin、windows等等。可以通过 go env 查看 GOOS 环境变量的值。
		- 操作系统的架构，环境变量中GOARCH的值，如：arch64、x86、i386等等。可以通过 go env 查看 GOARCH 环境变量的值。
		- 使用的编译器,gc或者gccgo。
		- 是否开启CGO,cgo。
		- golang版本号： 比如Go Version 1.1为go1.1,Go Version 1.12版本为go1.12，以此类推。
		- 其它自定义标签，通过go build -tags指定的值。
	- 例如：
		- 编译条件为(linux AND 386) OR (darwin AND (NOT cgo))
			- ```
			  // +build linux,386 darwin,!cgo
			  ```
		- 另外一个文件可以有多个编译约束,比如条件为(linux OR darwin) AND amd64
			- ```
			  // +build linux darwin
			  // +build amd64
			  ```
- 文件后缀
	- 除了编译标签，编译器也会根据文件后缀来自动选择编译文件，格式如下:
	- ```
	  $filename_$GOOS.go
	  $filename_$GOARCH.go
	  $filename_$GOOS_$GOARCH.go
	  ```
	- $filename: 源文件名称。
	- $GOOS: 表示操作系统，从环境变量中获取。
	- $GOARCH: 表示系统架构，从环境变量中获取。
	- 如在项目中有tcp.go和tcp_linux_x86.go 两个文件，执行:
		- ```
		  GOOS=linux GOARCH=x86 go build
		  ```
	- 将选择 tcp_linux_x86.go进行编译，而执行:
		- ```
		  GOOS=linux GOARCH=x86 go build
		  ```
- 利用ldflags在编译过程中为变量赋值
	- 本节为附加说明，不属于条件编译的范畴。有时我们需要在编译过程中为变量赋值，此时可以利用ldflags参数完成。ldflags是go build的一个参数，使用方式如下：
		- ```
		  go build -ldflags "-w -s -X main.Version=${VERSION} -X github.com/demo/version.BuildNo=${BUILD_NO}"
		  ```
		- 参数说明：
			- -w 删除DWARF信息：编译出来的程序无法用gdb进行调试。
			- -s 删除符号表：panic的stack trace没有文件名/行号信息，等价于C/C++程序被strip。
			- -X 替换包中的变量的值。
			- 加上-w -s可以有效减少编译出来地程序的大小，但不利于进行调试和日志追踪。