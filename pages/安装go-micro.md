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
	  go get github.com/micro/micro/v2@v2.4.0
	  go get github.com/golang/protobuf/proto@v1.3.5
	  go get github.com/golang/protobuf/protoc-gen-go@v1.3.5
	  go get github.com/micro/protoc-gen-micro/v2@v2.0.0
	  ```