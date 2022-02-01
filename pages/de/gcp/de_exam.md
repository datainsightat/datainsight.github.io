# Data Engineer Exam

[Data Engineer Exam Guide](https://cloud.google.com/certification/guides/data-engineer)  
[Google Cloud Documentation](https://cloud.google.com/docs/overview)

* Data Representation
* Pipelines
* Processing Infrastructure
<a/>

# Data Processing Systems

## Designing and building

### Data Processing Anatomy

![Data Processing Anatomy](../../img/gcp_de_exam_1.jpg)

### A view of data engineering on Google Cloud

![Data Engineering](../../img/gcp_de_exam_2.jpg)  

### Storage and Databases

![Storage and Databases](../../img/gcp_de_exam_3.jpg) 

### Processing

![Processing](../../img/gcp_de_exam_4.jpg)

### Data Processing Services

Combines storage and compute.  

![Services](../../img/gcp_de_exam_5.jpg)

#### Data Abstractions

|Service|Data Abstraction|Compute Abstraction|
|-|-|-|
|Dataproc, Spark|RDD|DAG|
|Bigquery|Table|Query|
|Dataflow|PCollection|Pipeline|

### Artificial Intelligence

![AI](../../img/gcp_de_exam_6.jpg)

### Pre- and Postpcocessing Services

![PrePost Processing](../../img/gcp_de_exam_7.jpg)

### Infrastructure Services

![Infrastructure Services](../../img/gcp_de_exam_8.jpg)

## Design Flexible Data Representations

|Storage|Type|Stored in|
|-|-|-|
|Cloud Storage|Object|Bucket|
|Datastore|Property|Entity > Kind|
|Cloud SQL|Values|Rows and Columns > Table > Database|
|Cloud Spanner|Values|Rows and Columns > Tables > Database|

### Data in Files and Data in Transit

![Data Types](../../img/gcp_de_exam_9.jpg)  

### Standard SQL Data Types

|Data type|Value|
|-|-|
|string|variable-length (unicode) character|
|int64|64-bit integer|
|float64|Double-precision decimal values|
|bool|true or false|
|array|ordered list of zero or more elements|
|struct|container of ordered fields|
|timestamp|represents an absolutej point in time|

### BigQuery Datasets, Tables and Jobs

* Project > Users and datasets
  * Limit access to datasets and jobs
  * Manage billing
* Dataset > Tables and views
  * Access Control Lists
  * Applied to all tables in the dataset
* Table > Collection of columns
  * Columnar storage
  * Views are virtual tables
  * Tables can be external
* Job > Potentially long-running action
  * Can be cancelled
<a/>

#### BigQuery is Columnar

![Columnar Storage](../../img/gcp_de_exam_10.jpg)

### Spark hides Complexity in RDDs

RDDs hide complexity and allow making decisions on your behald. Manages: Location, Partition, Replication, Recovery, Pipelining ...

![RDD](../../img/gcp_de_exam_11.jpg)

### Dataflow

#### PCollections

![PCollections](../../img/gcp_de_exam_12.jpg)

* Each step is a transformation
* All transformations are a pipeline
* Runner local, or in cloud
<a/>

* Each step is elastically scaled
* Each Transform is applied on a PCollection
* The result of an apply() is another PCollection
<a/>

#### Batch and stream processing

![Batch and Stream](../../img/gcp_de_exam_13.jpg)  

Bounded va Unbounded data. Dataflow uses windows to use streaming data. PCollections are not compatible with RDDs.

### Tensorflow

Opensource code for machine learning.  

![Tensor](../../img/gcp_de_exam_14.jpg)

## Design Data Pipelines

### Dataproc

* Cluster node options: Single node, Standard, High availability
* Benefits: Hadoop, Automated cluster management, Fast cluster resize
* HDFS: Use Cloud Storage for stateless solution
* HBASE: Use Cloud Bigtable for stateless solution
* Objective: Shut down the cluster, Restart per job
* Data storage: Dont't use hdfs
* Cloud storage: Match you data locatoin with the compute location
<a/>

#### Spark

Spark uses a DAG to process data. It executes commands only, if told to do so = "lazy evaluation" (oppostite "eager execution).

![Tensor](../../img/gcp_de_exam_14.jpg)

#### Dataproc can augment BigQuery

    projectId = <your-project-id>
    
    sql = "
      select
        n.year,
        n.month,
        n.day,
        n.weight_pounds
      from
        `bigquery-public-data.samples.natality` as n
      order by
        n.year
      limit 50"
      
    print "Running query ..."
    data = qbq.read_sql.gb1(sql,projectId=projectId)
    data[:5]

Extract data from BiqQuery using Dataproc and let Spark do the analysis.

#### Open Source Software

![Open Source](../../img/gcp_de_exam_16.jpg)

* Kafka > Pub/Sub
* HBASE > Cloud BigTable
* HDFS > Cloud BigStorage
<a/>

#### Initialization Actions

* Optional executable scripts
* Allow you to install additional components
* Provide common initialization actions on Github

#### Cluster Properties

* Allow you to modify properties in common configuration files like core-site.xml
* Remove the need to manually change property files
* Specified by file_prefix:property=value

## Dataflow

* Java, or Python
* Based on Apache Beam
* Parallel tasks
* Same Code does stream and batch
* Input from many sources
* Put code inside servlet, deploy it to App engine
* Side inputs
* User dataflow users to limit access to Dataflow ressources
<a/>

### Pipelines

![Dataflow Pipeline](../../img/gcp_de_exam_17.jpg)

### Operations

|Operation|Action|
|-|-|
|ParDo|Allows for parallel processing|
|Map|1:1 relationship between input and output in Python|
|FlatMap|Non 1:1 relationships|
|.apply(ParDo)|Java for Map and FlatMap|
|GroupBy|Shuffle|
|GroupByKey|Explicit Shuffle|
|Combine|Aggregate values|

Pipelines are often organized in Map and Reduce sequences.

### Templates

![Templates](../../img/gcp_de_exam_18.jpg)  

Separation for work and better ressource allocation.

## BigQuery

* Near real-time analysis
* NoOps
* Pay for use
* Date storage is inexpensive and durable
* Queries charged on amount of data processed
* Immutable audit logs
* Iteractive analysis
* SQL query language
* Many ways to ingest, transform, load and export data
* Nested and repeated fields
* UDFs in JavaScript
* Structured data
* Frontend does analysis
* Backend does storage
* Datawarehouse solution
* Access control: Project, dataset
<a/>

### Solutions

Separate compute and storage enables serverless execution.  

![Solutions](../../img/gcp_de_exam_19.jpg)  

## Design Data Processing Infrastructure

### Data Ingestion

![Ingestion](../../img/gcp_de_exam_20.jpg)  

### Load data into BigQuery

![Load data](../../img/gcp_de_exam_21.jpg)  

## PubSub

* Serverless global message queue
* Asynchronous: publisher never waits, a subscriber can get the message
* At-least-onve deliver guarantee
* Push subscription and pull subscription
* 100s of ms -- fast
</a>

Pub/Sub holds messages up to 7 days.

![PubSub](../../img/gcp_de_exam_22.jpg)

|Ingest|Processing|Analysis|
|-|-|-|
|Pub/Sub|Dataflow|BigQuery|

## Exam Guide Review

### Storage

Selecting the appropriate storage technologies
* Mapping storage systems to business requirements
* Data modeling
* Tradeoffs involving latency, thoughput and transactions
* Distributed sytems
* Schema design
<a/>

>Be familiar with the common use cases and qualities of the different storage options. Each storage system or database is optimized for different things - some are best at automatically updating the data for transactions. Some are optimized for speed of data retrieval but not for updates or changes. Some are very fast and inexpensive for simple retrieval but slow for complex queries.

### Pipelines

Designing data pipelines
* Data publishing and visualization
* Batch and streaming
* Online (interactive) vs batch predictions
* Job automation and orchestration
<a/>

>An important element in designing the data processing pipeline starts with selecting the appropriate service or collection of services.  
>All Platform Notebooks, Google Data Studion, BigQuery all have interactive interfaces. Do you know when to use each?

### Processing Infrastructure

Designing a data processing solution
* Choice of infrastructure
* System availability and fault tolerance
* use of distributed systems
* Capacity planning
* Hybrid cloud and edge computing
* Architecture options
* At least once, in-order, and exactly once event planning
<a/>

>Pub/Sub and Dataflow together provide once, in-order, processing and possibly delayed or repeated streaming data.  
>Be familiar with the common assemblies of services and how they are often used together: Dataflow, Dataproc, BigQuery, Cloud Storage and Pub/Sub.

### Migration

Migrating data warehousing and data processing
* Awareness of current state and how to migrate design to a future state
* Migrating from on-premise to cloud
* Validating a migration
<a/>

>Technologically, Dataproc is superior to Open Source Hadoop and Dataflow is superior to Dataproc. However, this does not mean that the most advanced technology is always the best solution. You need to consider the business requirements. The client might want to first migrate from the data center to the cloud. Make sure everything is working (validate it). And only after they are confident with that solution, to consider improving and modernizing.

# Building and Operationalizing Data Processing Systems

