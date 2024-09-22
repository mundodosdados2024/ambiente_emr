# Diretórios principais
export SPARK_HOME=/opt/spark
export JAVA_HOME=/usr/lib/jvm/jdk-17
export HADOOP_HOME=/opt/hadoop-3.3.6

# Configurando o PATH
export PATH=$SPARK_HOME/bin:$JAVA_HOME/bin:$HADOOP_HOME/bin:$PATH

# Versões e configurações de Hadoop e Spark
export HADOOP_VERSION=3.3.6
export SPARK_VERSION=3.5.2

# Configurações do Hadoop
export HADOOP_CONF_DIR=/etc/hadoop
export CORE_CONF_fs_s3a_connection_ssl_enabled=false
export MAPRED_CONF_mapreduce_map_java_opts=-Xmx512m
export MAPRED_CONF_mapred_child_java_opts=-Xmx512m
export CORE_CONF_fs_s3a_endpoint=http://minio:9000
export CORE_CONF_fs_defaultFS=hdfs://namenode:8020
export HDFS_CONF_dfs_permissions_enabled=false
export CORE_CONF_fs_s3a_path_style_access=true
export CORE_CONF_fs_s3a_access_key=datalake
export CORE_CONF_hadoop_proxyuser_hue_hosts=*
export CORE_CONF_hadoop_proxyuser_hive_hosts=*
export HDFS_CONF_dfs_webhdfs_enabled=true
export CORE_CONF_fs_s3a_impl=org.apache.hadoop.fs.s3a.S3AFileSystem
export CORE_CONF_fs_s3a_secret_key=datalake
export MAPRED_CONF_mapreduce_reduce_memory_mb=512
export HDFS_CONF_dfs_namenode_datanode_registration_ip___hostname___check=false
export CORE_CONF_hadoop_http_staticuser_user=root
export CORE_CONF_hadoop_proxyuser_hive_groups=*
export MAPRED_CONF_mapreduce_reduce_java_opts=-Xmx512m
export MAPRED_CONF_mapreduce_framework_name=yarn
export CLUSTER_NAME=lab
export MAPRED_CONF_mapreduce_map_memory_mb=512
export CORE_CONF_io_compression_codecs=org.apache.hadoop.io.compress.SnappyCodec
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/hadoop-3.3.6/share/hadoop/tools/lib/*
export CORE_CONF_hadoop_proxyuser_hue_groups=*
