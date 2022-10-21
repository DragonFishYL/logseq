- Ubuntu
	- ```shell
	  vim ~/.bash_profile
	  
	  export http_proxy="http://192.168.197.91:7890"
	  export https_proxy="http://192.168.197.91:7890"
	  ```
-
-
- Windows GoLand
	- ```shell
	  check connection 
	  ```
	- ![image.png](../assets/image_1666326262164_0.png)
	- ![image.png](../assets/image_1666326312207_0.png)
-
- Ubuntu 安装 clash
	- ```shell
	  wget https://github.com/Dreamacro/clash/releases/download/v1.11.8/clash-linux-amd64-v1.11.8.gz
	  gunzip clash-linux-amd64-v1.10.0.gz
	  mv clash-linux-amd64-v1.10.0 clash
	  chmod u+x clash
	  
	  # 转化订阅为配置文件
	  curl -o config.yaml 'https://s.trojanflare.com/clashx/f636a6df-6be4-4c0c-a300-fbbc58691f7d'
	  # 可以修改下配置文件中的日志级别为 debug
	  # 所有代理端口都用统一端口
	  mixed-port: 7890
	  # 是否其他机器可以连接词代理
	  allow-lan: false
	  mode: Rule
	  # log-level: silent
	  log-level: debug
	  
	  # 启动文件
	  ./clash -f config.yaml
	  
	  # 利用 Export 命令使用代理
	  export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
	  
	  # 测试 访问google
	  curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET "www.google.com"
	  ```
	- 参考：
		- https://github.com/Dreamacro/clash/wiki/configuration
		- https://codeswift.top/posts/clash-linux/