
rem echo %RegisterServicePrefix%
rem 以管理员身份运行;
rem 设置的是系统环境变量，如果设置了相同的用户环境变量，则用户环境变量会覆盖系统环境变量去掉则设置用户环境变量
setx /M FarmStory "/c/workspace/farm-story/"
setx /M RegisterServicePrefix "farm"
setx /M MongoAddr "mongodb://192.168.196.18:27017"
setx /M MysqlAddr "192.168.196.18:3306"
setx /M MysqlIp "192.168.196.18"
setx /M MysqlPort "3306"
setx /M MysqlName "root"
setx /M MysqlPasswd "123456"
setx /M EtcdAddr "192.168.196.18:2379"
setx /M KafkaAddr "192.168.196.18:9092"
setx /M GameRedisAddr "192.168.196.18:6020"
setx /M UserRedisAddr "192.168.196.18:6021"
setx /M BackstageRedisAddr "192.168.196.18:6022"
setx /M RegisterTTL 15
setx /M RegisterInterval 5
setx /M GoBuildArgs " -race "
setx /M MICRO_LOG_LEVEL "debug"
setx /M LogFileWithoutPid "1"
setx /M Environment "Develop"
setx /M FillErrorInfoFlag 1

pause
