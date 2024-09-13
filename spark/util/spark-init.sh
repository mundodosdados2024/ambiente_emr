spark-shell \
  --packages org.apache.iceberg:iceberg-spark-runtime-3.2_2.12:1.4.2 \
  --conf spark.sql.catalog.lake=org.apache.iceberg.spark.SparkCatalog \
  --conf spark.sql.catalog.lake.type=hadoop \
  --conf spark.sql.catalog.lake.warehouse=s3a://datahub-comportamental-input-dev/dados/warehouse/loterias/ \
  --conf spark.hadoop.fs.s3a.endpoint=http://minio:9000 \
  --conf spark.hadoop.fs.s3a.access.key=datalake \
  --conf spark.hadoop.fs.s3a.secret.key=datalake \
  --conf spark.hadoop.fs.s3a.path.style.access=true \
  --conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem