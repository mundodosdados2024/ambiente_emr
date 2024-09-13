# add Iceberg dependency
ICEBERG_VERSION=1.4.2
DEPENDENCIES="org.apache.iceberg:iceberg-spark-runtime-3.3_2.12:$ICEBERG_VERSION"
 
# add AWS dependnecy
AWS_SDK_VERSION=2.17.131
AWS_MAVEN_GROUP=software.amazon.awssdk
AWS_PACKAGES=(
    "bundle"
    "url-connection-client"
)
for pkg in "${AWS_PACKAGES[@]}"; do
    DEPENDENCIES+=",$AWS_MAVEN_GROUP:$pkg:$AWS_SDK_VERSION"
done
 
 
S3_WAREHOUSE='s3://serasaexperian-odin-data-mesh-dev-multiprovider/' 
GLUE_ID=294463638235
#
# start Spark SQL client shell
spark-shell --packages $DEPENDENCIES \
    --conf "spark.driver.extraJavaOptions=-Dhttp.proxyHost=10.96.215.26 -Dhttp.proxyPort=3128 -Dhttps.proxyHost=10.96.215.26 -Dhttps.proxyPort=3128" \
    --conf "spark.hadoop.hive.cli.print.header=true" \
    --conf spark.sql.catalog.spark_catalog=org.apache.iceberg.spark.SparkSessionCatalog \
    --conf spark.sql.catalog.spark_catalog.type=hive \
    --conf spark.sql.catalog.datahub=org.apache.iceberg.spark.SparkCatalog \
    --conf spark.sql.catalog.datahub.warehouse=$S3_WAREHOUSE \
    --conf spark.sql.catalog.datahub.catalog-impl=org.apache.iceberg.aws.glue.GlueCatalog \
    --conf spark.sql.catalog.datahub.io-impl=org.apache.iceberg.aws.s3.S3FileIO \
    --conf spark.sql.catalog.lake=org.apache.iceberg.spark.SparkCatalog \
    --conf spark.sql.catalog.lake.warehouse= $S3_WAREHOUSE\
    --conf spark.sql.catalog.lake.catalog-impl=org.apache.iceberg.aws.glue.GlueCatalog \
	  --conf spark.sql.catalog.lake.glue.lakeformation=false \
	  --conf spark.sql.catalog.lake.glue.id=$GLUE_ID \
    --conf spark.sql.catalog.lake.io-impl=org.apache.iceberg.aws.s3.S3FileIO \
    --conf spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions \
    --conf spark.sql.iceberg.check-nullability=false