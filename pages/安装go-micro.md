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