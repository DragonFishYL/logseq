- # vet
	- vet 是 golang 中自带的静态分析工具，可以让我们检查出 package 或者源码文件中一些隐含的错误。
	- ```
	  package main
	  
	  import "fmt"
	  
	  func main() {
	      test()
	  }
	  
	  func test() {
	      str := "Hello"
	      fmt.Printf("%d World", str)
	  }
	  ```
	- 这时候编译是可以通过的。但是很明显，我们在 %d 的位置是要打印一个字符串，应该用 %s，这时候如果用 vet 扫描一下就可以避免这个问题分析某个文件
	- ```
	  go vet main.go
	  ```
	- 得到以下分析结果
	- ```
	  $ go vet main.go 
	  # command-line-arguments
	  .\main.go:7:2: fmt.Printf format %d has arg str of wrong type string
	  ```
- # bodyclose
	- 可以用来检测 HTTP 响应主体是否关闭，使用方法：
	- ```
	  go vet -vettool=$(which bodyclose) github.com/timakin/go_api/...
	  ```