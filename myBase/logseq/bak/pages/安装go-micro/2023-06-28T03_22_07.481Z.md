- ### 安装protobuf
	- 操作步骤如下：
	- ```
	  curl -O https://github.91chi.fun//https://github.com//protocolbuffers/protobuf/archive/refs/tags/v3.19.4.tar.gz
	  cd ./protobuf-3.19.4
	  ./autogen.sh
	  ./configure
	  make
	  make install
	  
	  ```
	- 安装完成之后验证是否安装成功
	- ```
	   wangshibiao@192  ~/Downloads/tmp/protobuf-3.19.4  which protoc
	  /usr/local/bin/protoc
	   wangshibiao@192  ~/Downloads/tmp/protobuf-3.19.4  protoc --version
	  libprotoc 3.19.4
	   wangshibiao@192  ~/Downloads/tmp/protobuf-3.19.4 
	  
	  ```
- ### 切换protobuf版本
	- 假设当前系统中之前有按前述方法安装过多个版本的protobuf,那么若想方便地切换protof版本，只需要进入对应目录，执行make install即可。
		- 通过测试得知，/usr/local/bin/protoc文件仅仅是protoc的其中一个文件，仅替换该文件，生成的pb文件并不正确。为此，重新到对应版本下，重新执行下make install即可。 基于不同版本的protobuf，生成的pb文件内容会有所区别。
	- 操作过程示例如下：<a>https://www.sofineday.com/protobuf-install.html#%E5%88%87%E6%8D%A2protobuf%E7%89%88%E6%9C%AC</a>
- ### 安装go-micro v3
	- **注意: **如下的各个工具的版本要严格匹配，否则可能会有问题。
	- 安装go-micro工具集
	- ```
	  go get github.com/micro/micro/v2@v2.4.0
	  go get github.com/golang/protobuf/proto@v1.3.5
	  go get github.com/golang/protobuf/protoc-gen-go@v1.3.5
	  go get github.com/micro/protoc-gen-micro/v2@v2.0.0
	  
	  ```
- ### 安装go-micro v4
	- 安装protobuf 根据教程安装protobuf, 安装3.10.0版本的protobuf。
	- 安装go-micro工具集
	- ```
	  go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	  go install github.com/asim/go-micro/cmd/protoc-gen-micro/v4@latest
	  ```
- ### 切换go-micro版本
	- 若您有多个项目使用的是不同的go-micro版本，需要经常切换版本，那么建议编写切换脚本。示例如下：
	- ```
	   wangshibiao@192  ~  cat /usr/local/bin/switch_go-micro_v2.sh
	  #! /bin/sh
	  
	  cd ~/Downloads/tmp/protobuf-3.10.0 && make install
	  
	  go get github.com/micro/micro/v2@v2.4.0
	  go get github.com/golang/protobuf/proto@v1.3.5
	  go get github.com/golang/protobuf/protoc-gen-go@v1.3.5
	  go get github.com/micro/protoc-gen-micro/v2@v2.0.0
	   wangshibiao@192  ~ 
	   wangshibiao@192  ~  cat /usr/local/bin/switch_go-micro_v4.sh
	  #! /bin/sh
	  
	  cd ~/Downloads/tmp/protobuf-3.19.4
	  make install
	  
	  go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	  go install github.com/asim/go-micro/cmd/protoc-gen-micro/v4@latest
	   wangshibiao@192  ~ 
	  
	  ```