# Spark Cluster Docker

The project is based on the [Big Data Europe](https://www.big-data-europe.eu/) [HDFS/Spark Workbench](https://github.com/big-data-europe/docker-hadoop-spark-workbench.git) project.

# Cluster Architecture

|Interface|URL|
|-|-|
|Namenode|http://localhost:50070|
|Datanode|http://localhost:50075|
|Spark-Master|http://localhost:8080|
|Spark-Notebook|http://localhost:9001|
|HDFS Filebrowser (user:user)|http://localhost:8088/home|
|[Jupyter-Notebook](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)|http://localhost:8888|
|[Theia IDE](https://hub.docker.com/r/theiaide/theia)|http://loacalhost:3000|

# Start Cluster

Clone the [git project](https://github.com/BernhardMayrhofer/spark_hadoop_docker.git) and run

    $ docker network create hadoop
    $ docker-compose -f docker-compose-hive.yml up -d namenode hive-metastore-postgresql
    $ docker-compose -f docker-compose-hive.yml up -d datanode1 datanode2 datanode3 hive-metastore
    $ docker-compose -f docker-compose-hive.yml up -d hive-server
    $ docker-compose -f docker-compose-hive.yml up -d spark-master spark-worker1 spark-worker2 spark-worker3 spark-notebook hue
    $ docker container ls

Shut down the cluster by entering

    $ docker-compose down
    
# Get Data in the Cluster

Upload file using http://localhost:8088/filebrowser/

# Hadoop

## List Files Namenode

    $ docker exec -it namenode /bin/bash
    namenode $ hadoop fs -ls /user/user
    

## List Files Namenode through docker

    $ docker exec -it namenode hadoop fs -ls /user/user

# Spark

## Interactive Shell

    $ docker exec -it spark-master /bin/bash
    spark-master $ cd /
    spark-master $ ./spark/bin/spark-shell
    
## Run Example on Spark Master

Get the Spark Mart URL from here: http://localhost:8080/

    spark-master $  ./spark/bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://37272da9477d:7077 /spark/examples/jars/spark-examples_2.11-2.1.2-SNAPSHOT.jar 1000
    
 ## Run Example through Docker
 
    $ docker exec spark-master ./spark/bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://spark-master:7077 /spark/examples/jars/spark-examples_2.11-2.1.2-SNAPSHOT.jar 1000
