- 现有8.x版本mysql修改5.x版本的索引默认值，需要特殊处理
	- 1 修改安全模式
		- ```
		  set sql_mode="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
		  ```
	- 2 修改日期默认值
		- ```
		  ALTER TABLE account_data MODIFY date_of_birth date DEFAULT NULL COMMENT '实名认证出生日期';
		  ALTER TABLE finish_time MODIFY date_of_birth date DEFAULT NULL COMMENT '实名认证出生日期';
		  ```
	- 3 删除完数据把日期的默认值再改回来
		- ```
		  ALTER TABLE account_data MODIFY date_of_birth date DEFAULT '0000-00-00' COMMENT '实名认证出生日期';
		  ```
	-