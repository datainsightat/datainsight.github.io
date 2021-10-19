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

# Setup Cluster

Clone the [git project](https://github.com/BernhardMayrhofer/spark_hadoop_docker.git) and run

    $ docker network crate hadoop
    $ docker-compose up -d

Shut down the cluster by entering

    $ docker-compose down
