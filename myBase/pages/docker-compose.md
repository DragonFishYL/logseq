-
- docker-compose文件
	- ```
	  version: "2"
	  
	  services:
	    mysql:
	      image: mysql:8.0
	      container_name: mysql
	      restart: always
	      command: --default-authentication-plugin=mysql_native_password
	      ports:
	        - "3306:3306"
	      volumes:
	        - /data/mysql:/var/lib/mysql
	          #  - /data/my.cnf:/etc/my.cnf
	      environment:
	          - MYSQL_ROOT_PASSWORD=8dExSAPdCG
	          #- MYSQL_ROOT_PASSWORD=123456
	      privileged: true
	  
	    zookeeper:
	      image: bitnami/zookeeper:latest
	      container_name: zookeeper
	      restart: always
	      ports:
	        - "2181:2181"
	      volumes:
	        #- /data/zoo.cfg:/conf/zoo.cfg
	        - /data/zookeeper/data:/data
	        - /data/zookeeper/datalog:/datalog
	        - /data/zookeeper/logs:/logs
	      environment:
	        - ALLOW_ANONYMOUS_LOGIN=yes
	  
	    kafka:
	      image: bitnami/kafka:latest
	      container_name: kafka
	      restart: always
	      depends_on:
	        - zookeeper
	      volumes:
	        - /etc/localtime:/etc/localtime
	        - /data/kafka:/bitnami/kafka
	          # sudo chown -R 1001:1001  /data/kafka
	      ports:
	        - "9092:9092"
	      environment:
	        - KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092
	        #  - KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://172.16.123.181:9092
	        - KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://172.17.0.1:9092
	        - KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181
	        - ALLOW_PLAINTEXT_LISTENER=yes
	        - KAFKA_BROKER_ID=1
	  
	    etcd:
	      image: quay.io/coreos/etcd
	      container_name: etcd
	      restart: always
	      command: etcd -name etcd -advertise-client-urls http://0.0.0.0:2379 -listen-client-urls http://0.0.0.0:2379 -listen-peer-urls http://0.0.0.0:2380
	      ports:
	        - "2379:2379"
	        - "2380:2380"
	      volumes:
	        - /data/etcd:/etcd-data
	          #- /data/etcd.conf.yml:/opt/bitnami/etcd/conf/etcd.conf.yml
	          
	    mongo:
	      image: mongo:5.0
	      container_name: mongo
	      restart: always
	      ports:
	        - "27017:27017"
	      volumes:
	      #- /data/mongo/conf:/etc/mongo \
	      - /data/mongo/db:/data/db \
	      - /data/mongo/configdb:/data/configdb \
	      
	    redis-20: #这个名字不能重复
	      image: redis:6.0
	      container_name: redis-20
	      restart: always
	      ports:
	        - "6020:6379"
	      volumes:
	        - /data/redis/6020/:/data
	        #- /data/redis/conf/:/usr/local/etc/redis
	        - /etc/localtime:/etc/localtime:ro
	  
	    redis-21:
	      image: redis:6.0
	      container_name: redis-21
	      restart: always
	      ports:
	        - "6021:6379"
	      volumes:
	        - /data/redis/6021/:/data
	        #- /data/redis/conf/:/usr/local/etc/redis
	        - /etc/localtime:/etc/localtime:ro
	  
	    redis-22:
	      image: redis:6.0
	      container_name: redis-22
	      restart: always
	      ports:
	        - "6022:6379"
	      volumes:
	        - /data/redis/6022/:/data
	        #- /data/redis/conf/:/usr/local/etc/redis
	        - /etc/localtime:/etc/localtime:ro
	        
	    jaegertracing:
	      image: jaegertracing/all-in-one:latest
	      container_name: jaegertracing
	      restart: always
	      ports:
	        - "16686:16686"
	        - "6831:6831/udp"
	      volumes:
	        - /data/badger/:/badger
	      environment:
	        - SPAN_STORAGE_TYPE=badger
	        - BADGER_EPHEMERAL=false
	        - BADGER_DIRECTORY_VALUE=/badger/data
	        - BADGER_DIRECTORY_KEY=/badger/key
	  
	  ```
-