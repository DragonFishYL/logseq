- 1 编写Go语言微服务应用程序
	- 首先，需要编写一个使用Go语言编写的微服务应用程序。在这个示例中，我们假设应用程序是一个简单的Web服务，用于查询和显示用户信息。我们可以使用Go语言的Web框架，例如Gin或Echo，来快速编写一个Web服务。以下是一个使用Gin框架编写的示例代码：
	- ```
	  package main
	  
	  import (
	      "net/http"
	  
	      "github.com/gin-gonic/gin"
	  )
	  
	  func main() {
	      router := gin.Default()
	  
	      router.GET("/users/:id", func(c *gin.Context) {
	          id := c.Param("id")
	          c.JSON(http.StatusOK, gin.H{"id": id})
	      })
	  
	      router.Run(":8080")
	  }
	  ```
	- 在上述代码中，我们使用Gin框架定义了一个Web服务，该服务可以接收来自客户端的HTTP请求，并将请求中的参数ID返回给客户端。
- 2 编写Dockerfile
	- 接下来，我们需要编写一个Dockerfile文件，用于定义Docker镜像的构建过程。以下是一个简单的Dockerfile示例：
	- ```
	  FROM golang:1.17.1-alpine
	  
	  RUN mkdir /app
	  ADD . /app
	  WORKDIR /app
	  
	  RUN go build -o main .
	  
	  EXPOSE 8080
	  
	  CMD ["/app/main"]
	  ```
	- 在上述Dockerfile中，我们使用了golang:1.17.1-alpine作为基础镜像，该镜像包含了Go语言的运行环境。然后，我们将应用程序的源代码复制到容器的/app目录中，并使用go build命令编译应用程序。最后，我们使用EXPOSE指令将应用程序的端口暴露出来，并使用CMD指令定义容器启动后要执行的命令。
- 3 构建Docker镜像
	- 在完成了Dockerfile的编写后，我们需要使用Docker命令来构建Docker镜像。可以使用以下命令来构建镜像：
	- ```
	  docker build -t myapp .
	  ```
	- 在上述命令中，-t参数用于指定镜像的名称和标签，.表示使用当前目录中的Dockerfile文件进行构建。
- 4 登录docker仓库
	- 4.1 登录docker
	- ```
	  docker login -u1435033280 -p3500275Yl
	  ```
	- 如果报一下错误说明~/.docker/config.json文件被损坏
		- ```
		  panic: assignment to entry in nil map
		  
		  goroutine 1 [running]:
		  github.com/docker/cli/cli/config/credentials.(*fileStore).Store(0xc000387480, {{0x0, 0x0}, {0x0, 0x0}, {0x0, 0x0}, {0x0, 0x0}, {0x1c9b9b7, ...}, ...})
		  /go/src/github.com/docker/cli/cli/config/credentials/file_store.go:55 +0x49
		  github.com/docker/cli/cli/config/credentials.(*nativeStore).Store(0xc000408738, {{0x0, 0x0}, {0x0, 0x0}, {0x0, 0x0}, {0x0, 0x0}, {0x1c9b9b7, ...}, ...})
		  /go/src/github.com/docker/cli/cli/config/credentials/native_store.go:95 +0xb5
		  github.com/docker/cli/cli/command/registry.runLogin({0x1e65cd8, 0xc0003940f0}, {{0x0, 0x0}, {0xc000044110, 0xa}, {0x0, 0x0}, 0x0})
		  /go/src/github.com/docker/cli/cli/command/registry/login.go:156 +0x55d
		  ```
	- 解决方案
		- ```
		  mv ~/.docker/config.json ~/.docker/config.json.backup
		  ```
		- 然后重启docker,然后再重新登陆
- 5 制作docker镜像
	- 使用docker tag命令将本地的Docker镜像标记为要推送到Docker Hub上的仓库：
		- ```
		  docker tag my-image:1.0 username/my-repo:1.0
		  ```