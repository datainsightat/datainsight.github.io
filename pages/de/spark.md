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

