- 查看所有注册数据
	- ```
	  etcdctl --endpoints=172.16.0.241:2379 get --prefix ""
	  ```
- 监控所有节点变更信息
	- ```
	  etcdctl --endpoints=172.16.0.241:2379 watch --prefix ""
	  ```