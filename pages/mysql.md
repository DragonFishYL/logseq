- 现有8.x版本mysql修改5.x版本的索引默认值，需要特殊处理
	- 查看sql_mode
		- ```
		  SELECT @@sql_mode;
		  ```
	- 1 修改安全模式
		- ```
		  set sql_mode="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
		  ```
	- 2 修改日期默认值
		- ```
		  ALTER TABLE account_data MODIFY date_of_birth date DEFAULT NULL COMMENT '实名认证出生日期';
		  ALTER TABLE recharge_data MODIFY finish_time timestamp DEFAULT NULL COMMENT '完成时间';
		  ```
	- 3 删除完数据把日期的默认值再改回来
		- ```
		  ALTER TABLE account_data MODIFY date_of_birth date DEFAULT '0000-00-00' COMMENT '实名认证出生日期';
		  ALTER TABLE recharge_data MODIFY finish_time timestamp DEFAULT '0000-00-00' COMMENT '完成时间';
		  ```
	-