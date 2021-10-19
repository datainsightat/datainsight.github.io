# Concepts

Big Data 5 V's: Volume, Velocity, Variety, Veracity (Accuracy), Value  

Distributed Storage, Distributed Computing

# Hadoop

* HDFS: Distributed File System
* MapReduce: Distributed Computing
<a/>

          Name 
          Node (Master)
          |
    |-----|-----|
    Data  Data  Data
    Node  Node  Node (Slave)

## HDFS

Fault tolerance: Data is stored in block size of 128 MB and replicated over 3 machines (configurable).

# [Google Cloud (GCP) Dataproc](https://cloud.google.com/dataproc)

1) Enable Cloud Dataproc API > Create Cluster
2) Set up Cluster
3) Configure Node
4) CREATE
<a/>

![GCP Cluster](../img/gcp_cluster.jpg)

Use 'SSH' to get a Terminal to the master node. The nodes run on 'SMP Debian 5.1'.
  
## Upload Data to Master Node
  
[GitHub futureXsikill](https://github.com/futurexskill/bigdata)
  
    $ wget https://raw.githubusercontent.com/futurexskill/bigdata/master/retailstore.csv
  
## Move File from Master Node to Workers
  
    $ hadoop fs -ls
    $ hadoop fs -mkfir /user/newuser
    $ hadoop fs -put retailstore.csv /user/newuser/

## Move File from Workers to Master
  
    $ rm retailstore.csv
    $ hadoop fs -get retailstore.csv

# MapReduce and YARN
  
Way of sending computational tasks to Worker Nodes.  

                   Job   ->   RessourceManager
                              Job Tracker
                              |
                |-------------|-------------|
    Mapper(m)   NodeManager   NodeManager   NodeManager
    Reducer(r)  Task Tracker  Task Tracker  Task Tracker
    Mapper(m)

Map tasks reads reach row and fetches an element. Reduce task performs aggregation operations like calculating sum, average etc on the fetched element. YARN was implemented to run non-MapReduce jobs on Hadoop clusters.  
