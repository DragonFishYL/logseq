- 现有8.x版本mysql修改5.x版本的索引默认值，需要特殊处理
	- 查看sql_mode
		- ```
		  SELECT @@sql_mode;
		  ```
	- 1 修改安全模式
		- ```
		  set sql_mode="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
		  ```
	- 2 修改主键自增ID
		- ```
		  alter table account_data auto_increment=10000000;
		  ```
		-