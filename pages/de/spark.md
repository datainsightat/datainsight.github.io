# Spark Concept

In an HDFS context, Hive writes its tables on disks, which reduces speed. Spark keeps its data in memory, to improve performance. Spark can be used for batch processing and datastreaming.  
Spark is written in Scala.  

Hive > MapReduce > YARN > HDFS  
Spark > YARN|Mesos > HDFS|AWS|Azure|Blob|Relational DB|No SQL  

![Spark Framework](../img/spark_framework.jpg)

            Driver Program
            Spark Session
            |
    |-------|-------|
    Worker  Worker  Worker

# Cloud Setup

GCP > Dataproc > Create a Cluster > SSH

    $ wget https://raw.githubusercontent.com/futurexskill/bigdata/master/retailstore.csv
    $ hadoop fs -mkdir /user/newuser
    $ hadoop fs -mkdir /user/newuser/data
    $ haddop fs -put retailstore.csv data/

## Read CSV

    $ pyspark
    >>> spark.read.csv("data/retailstore.csv").show()
    >>> spark.read.option("header","True").csv("data/retailstore.csv").show()
    
    +----+------+------+-------+---------+
    | Age|Salary|Gender|Country|Purchased|
    +----+------+------+-------+---------+
    |  18| 20000|  Male|Germany|        N|
    |  19| 22000|Female| France|        N|

## Read Hive Table Python
 
    $ hive
    hive> create database if not exists retail;
    hive> use retail;
    hive> create table retailcust (age int, salary float, gender string, country string, purchased string) row format delimited fields terminated by ',' location '/user/newuser/data/' tblproperties ("skip.header.line.count"="1");
    
    $ spark
    >>> spark.sql("select * from retail.retailcust").show()

## Read Hive Table Scala

    $ spark-shell
    scala> spark.read.option("header","true").csv("data/retailstore.csv").show()
    
    +----+------+------+-------+---------+
    | Age|Salary|Gender|Country|Purchased|
    +----+------+------+-------+---------+
    |  18| 20000|  Male|Germany|        N|
    |  19| 22000|Female| France|        N|
    
    scala> spark.sql("select * from retail.retailcust").show()
    
## Setup Spark in [Google Colab](https://colab.research.google.com/)

Colab > File > New Notebook  

    colab> !wget https://raw.githubusercontent.com/futurexskill/bigdata/master/retailstore.csv
    colab> !wget https://dlcdn.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
    colab> !tar -xvf spark-3.1.2-bin-hadoop3.2.tgz
    colab> !ls
    
Check, if JVM11 is available (java-11-openjdk-amd64):
    
    colab> !ls /usr/lib/jvm/
    colab> import os
    colab> os.environ["JAVA_HOME"] = "/usr/lib/jvm/java-11-openjdk-amd64"
    colab> os.environ["SPARK_HOME"] = "/content/spark-3.1.2-bin-hadoop3.2"
    colab> !pip install findspark
    colab> import findspark
    colab> findspark.init()
    colab> !pip install pyspark
    colab> from pyspark.sql import SparkSession
    colab> spark = SparkSession.builder.master("local[*]").getOrCreate()
    
    colab> spark.read.option("header",True).csv("retailstore.csv").show()
    
# Spark for Data Transofmration

CSV-File, Hive Table > Spark Dataframe > Transform 1 > Transform 2 > Transform n > persist  

Spark is used for high-volume data.  

## Dataframes

Hold data in row-column format in memory.

    +----+------+------+-------+---------+
    | Age|Salary|Gender|Country|Purchased|
    +----+------+------+-------+---------+
    |  18| 20000|  Male|Germany|        N|
    |  19| 22000|Female| France|        N|
    +----+------+------+-------+---------+
    
# RDD - Resilient Distributed Dataset

The fundamental building blocks of Spark. Data ist splitted in multiple, redundant RDDs and distributed across different nodes. RDDs are held in memory and can be operated in parallel. Spark evaluates transformations 'lazyly'. Only if you: collect(), first(), head(), etc Sprak is working on the data.

    colab> !wget https://dlcdn.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
    colab> !tar -xvf spark-3.1.2-bin-hadoop3.2.tgz
    colab> import os
    colab> os.environ["JAVA_HOME"] = "/usr/lib/jvm/java-11-openjdk-amd64"
    colab> os.environ["SPARK_HOME"] = "/content/spark-3.1.2-bin-hadoop3.2"
    colab> !pip install findspark
    colab> import findspark
    colab> findspark.init()
    colab> from pyspark.sql import SparkSession
    colab> from pyspark import SparkContext
    colab> spark = SparkSession.builder.master("local[*]").getOrCreate()
    colab> sc = spark.sparkContext
    
create RDD
    
    colab> my_rdd = sc.parallelize([20,40,50,60,70])
    colab> my_rdd.collect()
    
    colab> !wget https://raw.githubusercontent.com/futurexskill/bigdata/master/retailstore.csv
    colab> my_csv_rdd = sc.textFile('retailstore.csv')
    colab> my_csv_rdd.collect()
    
    colab> my_csv_rdd.head()
    colab> for line in my_csv_rdd.collevt():
               print(line)

## Transformations

### Map()

Map calls an function an applies it on every line of the RDD. The number of lines of the old and the new rdd are the same. 

    newRDD = oldrdd.map(function)
    
    colab> my_csv_rdd_2 = my_csv_rdd.map(lambda x : x.replace("Male","M"))
    colab> my_csv_rdd_2.collect()

### Filter()

    newRDD = oldrdd.filter(function)
    
    colab> femaleCustomers = my_csv_rdd_2.filter(lambda x: "Female" in x)
    colab> femaleCustomers.collect()

### FlatMap()

Works like map, but the new rdd has more lines than the old one.  

    colab> words = femaleCustomers.flatMap(lambda line: line.split(","))
    colab> words.collect()
    colab> words.count()
    
### Set()

Combine two rdds.

    colab> rdd1 = sc.parallelize(["a","b","c","d","e"])
    colab> rdd2 = sc.parallelize(["c","e","k","l"])
    colab> rdd1.union(rdd2).collect()
    colab> rdd1.union(rdd2).distinct().collect()
    colab> rdd1.intersection(rdd2).collect()
    
    def transformRDD(customer):
        words = customer.split(",")
        
        if words[2] == "Male":
            words[2] = "0"
        else:
            words[2] = "1"
            
        if words[4] == "N":
            words[4] = "0"
        else:
            words[4] = "1"
            
        words[3] = words[3].upper()
        
        return ",".join(words)
        
    colab> my_csv_transform = my_csv_rdd.map(transformRDD)
    colab> my_csv_transform.collect()
    
## Actions

collect(), count(), take(), first()

### reduce()

    [10,20,30,40]

    sampleRDD.reduce(lambda a,b: a + b)
    
    func(func(func(10+20),30),40)
    
    colab> sampleRDD = sc.parallelize([10,20,30,40])
    colab> sampleRDD.reduce(lambda a,b: a + b)
    
# SparkSQL

    colab> customer_df = spark.read.csv("retailstore.csv",header=True)
    colab> customer_df.show()
    colab> customer_df.describe().show()
    
    +-------+-----------------+-----------------+------+-------+---------+
    |summary|              Age|           Salary|Gender|Country|Purchased|
    +-------+-----------------+-----------------+------+-------+---------+
    |  count|                9|                8|    10|     10|       10|
    |   mean|22.11111111111111|          31875.0|  null|   null|     null|
    | stddev|2.934469476943168|9818.895777311942|  null|   null|     null|
    |    min|               18|            20000|Female|England|        N|
    |    max|               27|            50000|  Male|Germany|        Y|
    +-------+-----------------+-----------------+------+-------+---------+

    colab> country_df = customer_df.select("country")
    colab> customer_df.groupBy("country").count().show()
    
    +-------+-----+
    |country|count|
    +-------+-----+
    |Germany|    3|
    | France|    4|
    |England|    3|
    +-------+-----+
    
    colab> customer_df.createOrReplaceTempView("customer")
    colab> results = spark.sql("select * from customer")
    colab> results.show()
   
## SQL API
   
    colab> new_results = spark.sql("select * from customer where age > 22")
    colab> new_results.show()
    
## Dataframe API

Dataframes are immutable. To change a dataframe, create a copy.
    
    colab> filtered_df = customer_df.filter('age>22')
    colab> filtered_df.show()

    colab> customer_df.groupBy("gender").agg({"salary":"avg","age":"max"}).show()
    
    colab> customer_df.select(["age","salary"]).show()

    colab> customer_df.withColumn('doubleSalary',customer_df['salary']*2).show()
    
    colab> new_customer_df = customer_df.withColumn('doubleSalary',customer_df['salary']*2)
    colab> new_customer_df.show()
    
    colab> customer_df.withColumnRenamed('salary','income').show()
    
    colab> customer_df.filter("salary > 30000").select('age').show()
    colab> spark.sql("select age from customer where salary > 30000").show()
    
    colab> customer_df.filter("salary > 30000 and salary < 40000").select('age').show()
    colab> spark.sql("select age from customer where salary > 30000 and salary < 40000").show()
    
    colab> from pyspark.sql.functions import countDistinct, avg, stddev
    colab> customer_df.select(countDistinct("country").alias("Distinct Countries")).show()
    colab> customer_df.select(avg('age')).show()
    colab> salary_std = ustomer_df.select(stddev('age'))
    
    colab> from pyspark.sql.functions import format_number
    colab> salary_std.select(format_number('std',2)).show()
    
    colab> customer_df.orderBy('salary').show()
    
    colab> from pyspark.sql.functions import col
    colab> customer_df.orderBy(col('salary').desc()).show()
    
    colab> new_df = customer_df.drop('pruchased')
    
    colab> customer_df.na.drop().show()
    colab> customer_df.na.fill('NEW VALUE').show()
    
    
    
