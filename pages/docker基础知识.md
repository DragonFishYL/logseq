- 1、基础知识
	- 1.1 安装条件
		- 必须是centos6.5及其以上版本
	- 1.2 语言环境
		- docker是由golang语言开发的
- 2、docker三要素
	- 镜像、容器、仓库
	- 2.1镜像
		- docker镜像(image)就是一个只读模板，镜像可以用来创建docker容器，一个镜像可以创建多个容器(相当于面向对象开发过程中 一个类可以实例化成多个对象)
		- 是一种联合文件系统unionFS(union file system),是一层一层，比如lnmp镜像包，就会包含整个lnmp环境以及其运行所需的环境。
		- • 是一种轻量级、可执行的独立软件包，用来打包软件运行环境和基于运行环境开发的软件。它包含运行某个软件所需要的所有内容，包括代码、库、运行时环境、环境变量和配置文件。
	- 2.2容器
		- docker利用容器(container)独立运行一个或者一组应用,容器使用镜像创建的运行实例。
		- 它可以被启动、开始、删除、停止。每个容器的运行是相互独立的、保证安全的平台。
		- 可以把容器看做是一个简易版的linux环境(包括root用户权限、运行空间、用户空间、网络空间等)和运行在其中的应用程序。
		- 容器的定义和镜像几乎一模一样，也是一堆层的统一视角，唯一的区别是容器的最上面那一层是可读可写的。
	- 2.3仓库
		- 仓库(repository)是集中存放镜像文件的场所
		- 仓库(repository)和仓库注册服务器(registry)是有区别的。仓库注册服务器上边往往存放着多个仓库，每个仓库中包含了多个镜像，每个镜像有不同的标签(tag)。
		- 仓库分为公开仓库(public)和私有仓库(private)两种形式。
		- 最大的公开仓库是docker hub，国内有阿里云、网易云等。
- 3、安装
	- 3.1Docker 要求 CentOS 系统的内核版本高于 3.10 ，查看本页面的前提条件来验证你的CentOS 版本是否支持 Docker 。
		- 通过 uname -r 命令查看你当前的内核版本
		- ```
		  uname -r 
		  ```
	- 3.2使用 root 权限登录 Centos。确保 yum 包更新到最新(已经是root用户则不需要加sudo切换)。
		- sudo yum update
	- 3.3卸载旧版本(如果安装过旧版本的话)
		- ```
		  sudo yum remove docker  docker-common docker-selinux docker-engine
		  ```
	- 3.4安装需要的软件包， yum-util 提供yum-config-manager功能，另外两个是devicemapper驱动依赖的
		- ```
		  sudo yum install -y yum-utils device-mapper-persistent-data lvm2
		  ```
	- 3.5设置yum源
		- ```
		  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
		  ```
	- 3.6可以查看所有仓库中所有docker版本，并选择特定版本安装
		- ```
		  yum list docker-ce --showduplicates | sort -r
		  ```
	- 3.7安装docker
		- ```
		  sudo yum install docker-ce  #由于repo中默认只开启stable仓库，故这里安装的是最新稳定版17.12.0
		  
		  sudo yum install <FQPN>  # 例如：sudo yum install docker-ce-17.12.0.ce
		  ```
	- 3.8启动并加入开机启动
		- ```
		  sudo systemctl start docker
		  sudo systemctl enable docker
		  ```
	- 3.9验证安装是否成功(有client和service两部分表示docker安装启动都成功了)
		- ```
		  docker version
		  ```
	- 3.10卸载旧版本的包
		- ```
		  sudo yum erase docker-common-2:1.12.6-68.gitec8512b.el7.centos.x86_64
		  ```