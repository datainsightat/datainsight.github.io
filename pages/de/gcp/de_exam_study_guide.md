# Google Data Engineering Cheatsheet
Compiled by Maverick Lin (http://mavericklin.com)
Updated by Bernhad Mayrhofer (http://www.datainsight.at)

## Sources

[Google Cloud Documentation](https://cloud.google.com/why-google-cloud)


## What is Data Engineering?

Data engineering enables data-driven decision making by collecting, transforming, and visualizing data. A data engineer designs, builds, maintain, and troubleshoots data processing systems with a particualr emphasis on the security, reliability, fault-tolernace, scalability, fidelity, and efficiency of such systems.  

A data engineer also analyzes data to gain insight into business outcomes, builds statistical models to support decision-maiking, and creates machine learning models to automate and simplify key business processes.  

Key Points
* Build/maintain data structures and databases
* Design data processing systems
* Analyze data and enable machine learning
* Design for reliability
* Visualize data and advocate policy
* Model business processes for analysis
* Design for security an complience
<a/>

## Google Compute Platform (GCP)

GCP is a collection of Google computing resources, which are offered via services. Data engineering services include Compute, Storage, Big Data, and Machine Learning.  

The 4 ways to interact with GCP include the cconsole, command-line-interface (CLI), API, and mobile app.  

The GCP resource hierarchy is organized as follows. All resources (VMs, storage buckets, etc) are organized into projevts. These projects may be orgnized into folders, which can contain other folders. All folders and projects can be brought tohether under an organization node. Project folders and organization nodes are where policies canb be defined. Policies are inherited downstream and dictate who can access what resources. Every resource must belong to a project and every project must have a billing account associated with it.  

Advantages: Performance (fast solutions), Pricing (sub-hour billing, sustained use discounts, custom machine types), PaaS Solutions, Robust Infrastructure

## Hadoop

### Overview

Data can no longer fit in memory on one machine (monolithic), so a new way of computing was devised using many computers to process the data (distributed). Such a group is called a cluster, which makes up server farms. All of these servers have to be coordinated in the following ways: partition data, coordinate computing tasks, handle fault tolerance/recovery, and allocate capacity to process.  

Hadoop is an open source distributed processing framework that manages data processing and storage for big data applications running in clusterd systems. It is comprised of 3 main components:
* Hadooop Distributed Files System (HDFS): a distributed file system that provides high-throughput access to application data by partitioning data cross many machines.
* YARN: framework for job scheduling and cluster resource management (task coordination).
* MapReduce: YARN-based system for parallel processing of large data sets on multiple machines.
<a/>

#### HDFS

Each disk on a different machine in a cluster is comprised of 1 master node; the rest aare data nodes. The master node manages the overall file system by storing the directory structure and metadata of the files. The data nodes physically store the data. Large files are broken up/distributed across multiple machines, which are replicated across 3, or more, machines to provides fault tolerance.

#### MapReduce

Parallel programming paradigm which allows for processing of huge amounts of data by running processes on multiple machines. Defining a MapReduce job requires two stages: map and reduce.
* Map: operation to be performed in parallel on small portions of the dataset. The output jis akey-value pair <K,V>
* Reduce: operation to combine the results of Map
<a/>

#### YARN - Yet Another Resource Negotiator

Coordinates tasks running on the cluster and assigns new nodes in case of failure. Comprised of 2 subcomponents: the resouces manager and the node manager. The resource manager runs on a single master node and schedules tasks across nodes. The node manager uns on all other nodes an manages tasks on the individual node.

### Hadoop Ecosystem

An entire ecosystem of tools have emerged around Hadoop, which are based on tineracting with HDFS.

#### Hive

A data warehouse software built on top of Hadoop that faciliates readding, writing, and managing large datasets residing in distributed sorage using SQL-like queries (HiveQL). Hive abstracts away underlying MapReduce jobs and returns HDFS in the form of tables (HDFS).

#### Pig

A high level scripting language (Pig Latin) that enables writing complex dat transformations. It pulls unstructured/incompolete data from sources, cleans it, and places it in a database/data warehouse. Pig performs ETL into data warehouse while Hive queries from data warehouse to perform analysis (GCP: DataFlow).

#### Spark

Framework for writing fast, distributed programs for data processing and analysis. Spark solves similar problems as Hadoop MapReduce but with a fast in-memory approach. It is an unified engine that suppoerts SQL queries, stremaing data, machine learning and graph processing. Can operate spearately from Hadoop but integrates well with Hadoop. Data is processed using Resilient Distributed Datasets (RDDs), whic are immutable, lazily evaluated, and tracks lineage.

#### Hbase

Non-relationsl, NoSQL, column-oriented database management system that runs on top of HDFS. Well suited for sparse data sets (GCP: BitTable)

#### Flink/Kafka

Stream processing framework. Batch streaming is for bounded, finite datasets, with periodic updates, and delayed processing. Stream processing is for unboundedj datasets, with continuous updates, and immediate processing. Stream data and stream processing must be decoupled via a message queue. Can group streaming data (windows) using tumblind (non-overlapping time), sliding (overlapping time), od session (session gap) windows (GCP: Pub/Sub).

#### Beam

A programing model to define and execute data processing pipelines, including ETL, batch and stream (continuous) processing. After building the pipeline, it is executed by one of Beam's distributed processing backends (Apache Apex, Apache Flink, Apache Spark and Google Cloud Dataflow). Modeled as a Directed Acyclic Graph (DAG).

#### Oozie

Workflow scheduler system to manage Hadoop jobs

#### Sqoop

Transferring framework to transfer large amounts of data into HDFS from relational databases (MySQL)

## Indentity Access Management (IAM)

Access management service to manage different members of the platform- who has what access for which resource.  

Each member jhas roles and permissions to allow them access to perform their duties on the platform. 3 member types: Google account (single person, gmail account), service acocunt (non-person, application), and Google Group (multiple people). Roles are a set of specific permissions for members. Cannot assign permissions to user directly, must grant roles.  

If you grant a member access on a higher hierarchy level, that member will have access to all levels below that hierarchy level as well. You cannot be restricted a lower level. The policy is a union of assigneed and inherited plicies.

* Primitive Roles: Owner (full access to reources, manage roles), Editor (Edit access to resources, change of add), Viewer (read access to resources)
* Predefined Roles: Finer-grained access control than primitve roles, predefined by Google Cloud
* Custom Roles
<a/>

Best Practice: use predefined roles when they exist (over primitive). Follow the principle of least privileged facors.

## Stackdiver

GCP's monitoring, logging, and diagnostics solution. Provides insights to health, performance, and availability of applications.  

Main functions:
* Debugger: inspect state of app in real time without stopping/slowing down e.g. code behaviour
* Error Reporting: counts, analyzes, aggregates crashes in coud services
* Monitoring: overview of performance, uptime and health of cloud services (metrics, events, metadata)
* Alerting: create plicies to notify you when health and uptime check results exceed a certain limit
* Tracing: tracks how requests propagate through applications/receive near real-time performance results, latency reports of VMs
* Logging: store, search, monitor and analyze log data and events from GCP
<a/>

## Key Concepts

### OLAP vs OLTP

* Online Analytical Processing (OLAP): primary objective is data analysis. It is an online analysis and data retrieving process, characterized by a large volume of data an complex queries, uses data warehouses.
* Online Transaction Processing (OLTP): primary objective is data processing, manages database modification, characterized by large numbers of short online transctions, simple queries, and traditional DBMS.

### ACID (SQL)

ACID defines a set of 4 properties of a SQL transaction:

* Atomicity: Each statemnent in a transction is treated as a single unit.
* Consistency: Transactions only make changes to tables in predefined, predictable ways.
* Isolation: When multiple users are reading and writing from the same table, isolation of transactions ensures that these transactions don't interfere with each other.
* Durability: Ensures that changes to data made by a succesfully executed transaction will be saved, even in the event of a system failure
<a/>

### Row vs Columnar Database

* Row Format: stores dat avy row
* Column Format: sotres data tables by column rather than by row, which is suitable for analytical query processing and data warehouses.
<a/>

### IaaS, PaaS, SaaS

* IaaS: gives you the infrasttructure pieces (VMs) but you have to maintain/join together the different infrastructure pieces for your application to work. Most flexible option.
* PaaS: gives you all the infrastruct pieces already joined so you just have to deploy source code on the platform for your application to work. PaaS solutions are managed services/no-ops (highly available/reliable) and serverless/autoscaling (elastic). Less flexible than IaaS
* Fully Managed, Hotspotting.
<a/>

## Compute Choices

AppEngine is the PaaS option- serverless and ops free. Compute Engine is the IaaS option- fully controllable down to OS level. Kubernetes Engine is in the middle- clusters of machines running Kubernetes and hosting containers.  

You can also mix and match multiple compute options.
* Preemtible Instances: instances that run at a much lower price but may be terminated at any time, self-terminate after 24 hour. Ideal for interruptible workloads.
* Snapshots: used for backups of disks
* Images: VM OS
<a/>

### Google App Engine

Flexible, serverless platform for building highly available applications. Ideal when you want to focus on wirting and developing code oand do not want to manage servers, cluster, of infrastructures. Use Cases: web sites, mobile app and gaming backends, RESTful APIs, IoT apps.

### Google Kubernetes (Container) Engine

Logical infrastructure powered by Kubernetes, an open-source conttainer orchestration system. Ideal for managing containers in productino, increase velocity and operatability, and don't have OS dependencies. Use Cases: containerized workloads, cloud-native distributed systems, hybrid applications.

### Google Compute Engine (IaaS)

Virtual Machines (VMs) running in Google's global data center. Ideal for when you need complete control over your infrastructure and direct access to high-performance hardware or need OS-level changes. Use Cases: any workload requiring a specific OS or OS configuration, currenty deployed and on-premises software that you want to run in the cloud.

## Storage

### Persistent Disk

Fully-managed block storage (SSDs) that is suitable for VMs(containers. Good for snapshots of data backups/sharing read-only data across VMs.

### Cloud Storage

infinetly scalable, fully-managed and highly reliable object/blob storage. Good for data blobs: images, pictures, videos. Cannot query by content.  

To use Cloud Storage, you create buckets to store data and the location can be specified. Bucket names are globally unique.  

Storage classes:
* Multi-Regional: frequnt access from anywhere in the world. Use for "hot data"
* Regional: high local performance for region
* Nearline: storage for data accessed less than once a month (archival)
* Coldline: less than once a year (archival)
<a/>

## Relational DBs

### Cloud SQL

Fully-managed relational database service (supports MySQL/PostgresSQL). Use for relational data: tables, rows and columns, and super structured data. SQL compatible and can update fields. Not scalable (small storage- GBs). Good for web frameworks and OLTP workloads (not OLAP). Can use Cloud Storage Transfer Service of Transfer Applicance to data into Cloud Storage (from AWS, local, another bucket). Use gsutil if compying files over from on-premise.

### Cloud Spanner

Google-proprietary offering, more advanced than Cloud SQL. Mission-critical, relational database. Supports horizontal scaling. Combines benefits of relational and non-relational databases.

* Ideal: relational, structured, and semi-structured data that requires high availibility, strong consistency, and transactional reads and writes.
* Avoid: data is not relational or structured, want an open source RDBMS, strong consitency and high availability is unnecessary

#### Cloud Spanner Data Model

A database can contain 1+ tables. Tables look like relational database tables. Data is strongly typed: must define a schema for each database and that schema must specify the data types of each column of each table. Parent-Child Relationsships: can optinally define relationships between tables to physicall co-locate their rows for effiecient retrieval (data locality: physicall storing 1+ rows of a table with a row from another table.

### BigTable

Columnar database ideal applications that need high throughput, low latencies, and scalability (IoT, user analytics, time-series data, graph data) for non-structured key/value data (each value is < 10 MB). A single value in each row is indexed and this value is knwon as the row key. Does not support SQL queries. Zonal service. Not good for data less than 1 TB of data or items greater than 10 MB. Ideal at handling large amounts of data (TB/PB) for long periods of time.

#### Data Model

4-Dimensiona: row key, column family (table name), coolumn name, timestamp.
* Row key uniquely identifies an entity and coluns contain individual values for each row
* Similar columns are grouped into column families
* Each column is identified by a combination of the column family and a column qualifier, which is a unique name within the column family
<a/>

#### Load Balancing

Automatically manages splitting, merging, and rebalancing. The master process balances workload/data volume within clusters. The master splits busier/larger tables in half and merges less accessed/smaller tables together, redistributin them between nodes. Best write performance can be achieved by using row keys that do not follow a predictable order and grouping related rows so they are adjacent to one another, which results in more efficient multiple row reads at the same time.

#### Security

Security can be managed at the project and instance level. Does not support tabl-level, row-level, column-level, or cell-level security restrictions.

#### Design Schema

For time-series data, use tall/narrow tables. Denormalize- prefer multiple tall and narrow tables.  

Designing a Bigtable schema is different than designing a schema for a RDMS. Important considerations:
* Each table has only one index, the row key (4 KB)
* Rows are sorted lexicographically by row key.
* All operations are atomic (ACID) by row key
* Both reads and writes should be distributed evenly
* Try to keep all info for an entity in a single row
* Related entitites should be stored in adjacent rows
* Try to store 10 MB in a single cell (max 100 MB) and 100 MB in a single row (max 256 MB)
* Supports max of 1000 tables in each instance.
* Choose row keys that don't follow predictable order
* Can use up to around 100 column families
* Column Qualifiers: can create as many as you need in each row, but should avoid splitting data across more column qulifiers than necessary (16 KB)
* Tables are sparse. Empty columns don't take up any space. Can create large number of columns, even if most columns are empty in most rows.
* Field promotion (shift a column as part of the row key) and salting (remainder of division of hash of timestamp plus a row key) are ways to help desin row keys.
<a/>

## Other Storage Options

* Need SQL OLTP: Cloud SQL/Cloud Spanner
* Need interactive querying for OLAP: BigQuery
* Need to store blobs larger than 10 MB: Cloud Storage
* Need to store structured objects in a document database, with ACID and SQL-like queries: Cloud Datastore
<a/>

## BigQuery

Scalabele, fus queryng for fully-managed Data Warehouse with extremely fast SQL queries. Allows querying for massive volumes of data at fast speeds. Good for OLAP workloads (petabyte-scal), Big Data exploration and processing, and reporting via Business Intelligence (BI) tools. Supports SQL querying for non-relational data. Relatively cheap to store, but costly for querying/processing. Good for analyzing historical data.

### Data Model

Data tables are organized into units called datasets, which are sets of tables and views. A table must belong to dataset and a dataset must belong to a project. Tables contain records with rows and columns (fields). You can load data into BigQuery via two options: batch loading (free) and streaming (costly).

### Securtiy

BigQuery uses IAM to manage access to resources. The three types of resources in BigQuery are organizations, projects, and datasets. Security can be applied at the project and dataset level, but not for view level.

### Views

A view is a virtual table defined by a SQL query. When you create a view, you query it in the same way you query a table. Authorized views allo you to share query results with particular users/groups without givin them access to underlying data. When a user queries the view, the query results contain data only from the tables and fields specified in the query that defines the view.

### Billing

Billing ist based on storage (amount of data stored), querying (amount of data/number of bytes prcesssed by query), and streaming inserts. Storage options are active and long-term (modified or not past 90 days). Query optinos are on-demand and flat-rate.  
Query costs are based on how much data you read/process, so if you only read a section of a table (partition), your costs will be reduced. Any charges occurred are billed to  the attached billing account. Exporting/importing/copying data is free.

### Partitioned tables

Special tables that are divided into partitions based on a column or partition key. Data is stored on different directories and specific queries will only run on slices of data, which improces query performance and reduces costs. Note that the partitions will not be of the same size. BigQuery automatically does this.  
Each partitioned tables can hace up to 2500 partitions (2500 days or a few years). The daily limit ist 2000 partition updates per table, per day. The rate limit: 50 partition updates every 10 seconds.  

 Two types of partitioned tables:
 * Ingestion Time: Tables partitioned based on the data's ingestion (load) data or arrival date. Each partitioned tables will have a pseudocolum _PARTITIONTIME, or time data was loaded into table. Pseudocolumns are reserved for the table and cannot be used by the user.
 * Partitioned Tables: Tables that are partitioned based on a TIMESTAMP or DATE columns.
 <a/>
 
 ### Windowing
 windows functions increase the efficiency and reduce the complexity of queries that analyze partitions (windows) of a dataset by providing complex operations without the need for many intermediate calculations. They reduce the need for intermediate tables to store tmporary data.
 
 ### Bucketing
 Like partitioning, but each split/partition should be the same size and is based on the hash function of a column. Each bucket is aparate file, which makes for more efficient sampling and joining data.
 
 ### Querying
 
 After loading data into BigQuery, you can query using Standard SQL (preferred) or Legacy SQL (old). Query jobs are actions executed asynchronously to load, export, query, or copy data. REsults can be saved to permanent (store) or temporary (cache) tables. 2 types of queries:
 * Interactive: query is executed immediately, counts toward daily/concurrent usage (default)
 * Batch: batches of queries are queued and the query starts when idle resources are available, only counts for daily and switches to interactive if idle for 24 hours.
 ### Wildcard Tables
 Used if you want to union all similar tables with similar names. '*' (e.g. project.dataset.Table*)
 ### Controlling Costs
 * Avoid SELECT * (full scan), select only columns needed (SELECT * EXCEPT)
 * Sample data using preview options for free
 * Preview queries to estimate costs (dryrun)
 * Use max bytes billed to limit query costs
 * Don't use LIMIT clause to limit costs (still full scan)
 * Monitor costs using dashboards and audit logs
 * Partition data by date
 * Break query results into stages
 * Use default table expiratoin to delete unneeded data
 * Use streaming insert wisely
 * Set hard limit on bytes (members) processed per day
 <a/>
 
### Query Performance

Generally, queries that do less work perform better.

### Input Data/Data Sources

* Avoid SELECT *
* Prune partitioned queries (for time-partitioned table, use PARTITIONTIME pseudo column to filter partitions)
* Denormalize data (use nested and repeated fields)
* Use external data sources appropriately
* Avoid excessive wildcard tables
<a/>

### SQL Anti-Patterns

* Avoid self-joins, use window functions (perform calculations ocross many table rows related to current row)
* Partition/Skew: Avoid unequally sized partitions, or when a value occurs more often than any other value.
* Cross-Join: avoid joins that generate more outputs than inputs (pre-aggregate data or use window function) Update/Insert Single Row/Column: avoid point-specific DML, insted batch updates and inserts

### Managing Query Outputs

* Avoid repreated joins and using the same subqueris
* Writing large sets has performance/cost impacts. Use filters or LIMIT clause. 128MB limit for cached results
* Use LIMIT clause for large sorts (REsources Exceedded)

### Optimizing Query Computation

* Avoid repeatedly transforming data via SQL queries
* Avoid JavaScript user-defined functions
* Use approximate aggregation functions (approx count)
* Order-query operations to maximise performance. Use ORDER BY only in outmost query, puash complex operations to end of the query.
* For queries that join data from multiple tables, optimize join patterns. Start with the largest table.

## DataStore

NoSQL document databese that automatically handles sharding and replication (highliy available, scalable and druable). Supports ACID transactions, SQL-like queries. Query execution depends on size of returned result, not size of dataset. Ideal for "needle in a haystack" operation and applications that rely on highly available structured data at scale.

### Data Model

Data objects in Datastore are known as entities. An entity has one or more named properties, each of which can have one or more values. Each entity has a key that uniquely identifies it. You can fetch an individual entity using the entity's key, or query one or more entities based on the entities' key or property values.  

Ideal for highly structured data at scale: product catalogs, customer experience based on users past activities/preferences, game states. Don't use if you need extremly low latency or analytics (complex joins, etc).
## DataProc

Fully-managed cloud service for running Spark and Hadoop clusters. Provides access to Hadoop cluster on GCP and Hadoop-ecosystem tools (Pig, Hive, and Spark). Can be used to implement ETL solution.  

Preferred if migrating existing on-premise Hadoop or Spark infrastrucutre to GCP without redevelopment effort. Dataflow is preferred for a new development.

## DataFlow

Managed service for developing and executing data processing patterns (ETL) (based on Apache Beam) for streaming abd batch data. Preferred for new Hadoop or Spark infrastrucutre development. Usually site between front-end and back-end storage solutions.

### Concepts

#### Pipeline

Encapsulates series of computations that accepts input data from external sources, transforms data to provide some useful intelligence, and produce output

#### PCollections

Abstraction that represents a potentially distributed, multi-element data set, that acts as the pipeline's data. PCollection objects represent input, intermediate, and output data. The edges of the pipeline.

#### Transforms

Operations in pipeline. A transform takes a PCollectoins(a) as input, performs an operations that you specify on each element in that cellections, and produces a new output PCollection. Uses the "what/where/when/how" model. Nodes in the pipeline. Composite transforms are mutluple transforms: combining, mapping, shuffling, reducing, or statistical analysis.

#### Pipeline I/O

The source/sink, where the data flows in and out. Supports read and write transforms for a number of common data storage types, as well as custom.

#### Windowing

Windowing a PCollectoin divides the elements into windows based on the associated event time for each element. Especially useful for PCollections with unbounded size, since is allows operating on a sub-group (mini-batches).

#### Triggers

Allows specifying a trigger to control when (in processing time) results for the given window can be produced. If unspecified, the default behavior is to trigger first when the watermark passes the end of the window, and then trigger again every time there is late arriving data.

## Pub/Sub

Asynchronous messaging service that decouples senders and receivers. Allows for secure and highly available communication between independently written applications. A publisher app creates and sends messages to a topic. Subscriber applicatoins create a subscription to a topic to receive messages from it. Communicatoin can be one-to-many (fan-out), many-to-one (fan-in), and many-to-many. Gurantees at least one delivery before deletion from queue.

### Scenarios
* Balancing workloads in network cluster- queue can efficiently distribute tasks
* Implementing asynchronous workflows
* Data streaming from various processes or devices
* Reliablility improvement- in case or zone failure
* Distributing event notifications
* Refreshing distributed caches
* Logging to multiple systems
<a/>

### Benefits/Freatures

Unified messaging, global presence, push- and pull-style subscriptions, replicated storage and guaranteed at-least-once message delivery, encryption of data rest/transit, easy-to-use REST/JSON API.

### Data Model

Topic, Subscription, Message (combination of data and attributes that a publisher sends to a topic and is eventually delivered to subscribers), Message Attribute (key-value pair that a publisher can define for a message).

### Message Flow

* Publisher creates a topic in the Cloud Pub/Sub service and sends messages to the topic.
* Messages are persisted in a message store until they are delivered and scknowledged by subscribers
* The Pub/Sub service forwards messages from a topic to all of its sibscriptions, individually, Each subscription receives messages either by pushing/pulling.
* The subscriber receives pending messages from its subscription and acknowledges message
* When a message is acknowledged by the subscriber, it is removed from the subscription's message queue.
<a/>

## ML Engine

Managed infrastructure of GCP with the power and flexibility of Tensorflow. Can use it to train ML models at scale and host trained models to make predictions about new data in the cloud. Supported frameworks include Tensorflow, scikit-learn and XGBoost.

### ML Workflow

Evaluate Problem: What is the problem and is ML the best approach? How will you measure model's success?
* Choosing Development Environment: Supports Python 2 and 3 and supports TF, scikit-learn, XGBoost as frameworks.
* Data Preparation and Exploration: Involves gathering, cleaning, transforming, exploring, splitting, and preprocessing data. Also includes feature engineering.
* Model Training/Testing: Provide access to train/test data and train them in batches. Evaluate progress/results and adjust the model as neede. Export/save trained model (250MB or smaller to deploy in ML Engine).
* Hyperparameter Tuning: Hyperparametters are variables that govern the training process itself, not related to the training data itself. Usually constant during training.
* Prediction: Host you trained ML models in the cloud and use the Cloud ML prediction service to infer target values for new data.
<a/>
### ML APIs

* Speech-to-Text: Speech-to-text conversion
* Text-to-Speech: Text-to-speech conversion
* Translation: Dynamically translate between languages
* Vision: Derive insight (object/text) images
* Natural Language: Extract information (sentiment, intent, entity, and syntax) about text: , 
* Video Intelligence: Extract metadata from videos
<a/>
### Cloud Datalab

Interactive tool (run on an instance) to explore, analyze, transform and visualize data and build machine learning models. Built on Jupyter. Datalab is free but may incrus costs based on usages of other services.
### Data Studio

Turns your data into informative dashboards and reports. Updates to data will automatically update in dashboard. Query cache remembers the queries (requests for data) issued by the components in a reports (lightning bolt)- turn off for data that changes frequently, want to prioritize freshness over performance, or usig data source that incurs usage costs (eg BigQuery). Prefetch cache predicts data that could be requested by analyzing the dimentsions, metrics, filters, and data range properties and controls on the report.

## ML Concepts

### Features

Input data used by the ML Model

### Feature Engineering

Transforming input features to be more useful for the mod3els. Eg mapping categories to buckets, normalizing between -1 and 1, removing null.

### Train, Eval, Test

Training is data used to optimize the model, evaluation is used to assess the model on new data during training, test ist used to provice the final result.

### Classification, Regression

Regression is predictting a number (eg housing price), classification is predicting from a set of categories (eg red, blue, green)

### Linear Regression

Predicts an output by multipyling and summing input features with weigths and biases

### Logisic Regression

Similar to liniear regression but predicts a probability

### Neural Network

Composed of neurons (simple building blocks that actually "learn"), contains activation functions that makes it possible to predicts non-linear ouputs.

### Activation Functions

Mathematical functions that introduce non-linearity to a network eg RELU, tanh

### Sigmoid Functions

Function that maps very negative numbers to a number very close to 0, huge numbers close to 1, and 0 to .5 Useful for predicitng probabilities.

### Gradient Descent/Backpropagation

Fundamental loss optimizer algorithms, of which the other optimizers are usually based. Backpropagation is similar to gradient descent but for neural nets.

### Optimizer

Operations that chanes the weights and biasses to reduce loss eg Adagrad or Adam

### Weights, Biases

Weights are values that the input features are mutliplied by to predict an output value. Biases the value of the output given a weight of 0.

### Converge

Algorithm that converges will eventually reach an optimal answer, even if very slowly. An algorithm that doesn't converge may never reach an optimal answer.

### Learning Rate

Rate at which optimizers change weights an biases. High learning rate generally trains faster but risks not converging, whereas a lower rate trains slower.

### Overfitting

Model performs great on the input data but poorlyj on the test data (combat by dropout, early stopping, or reduce # of nodes or layers)

### Bias, Variance

How much output is determined by the features. More variance often can mean overfitting, more biasj can mean a bad model.

### Regularization

Variety of apporaches to reduce overfitting, including adding the weihts to the loss function, randomly dropping layers (dropout)

### Ensemble Learning

Mapping from discrete objects, such as words, to vectors of real numbers, useful because classification/neural networks work well on vectors of real numbers.

## Tensorflow

Tensorflow is an open source software library for numerical computation using data flow graphs. Everything in TF is a graph, where nodes represent operations on data. Edges represent data. Phase 1 of TF is building up a computation graph and phase 2 is executing it. It is also distributed, meaning it can run on either a cluster of machines or just a single machine.

### Tensors

In a graph, tensors are the edges and are mutlidimensional data arrays that flow through the graph. They are the central unit of data in TF and consist of a set of primitive values shaped into an array of any number of dimensions.  

A tensor is characterized by its rank (# dimensions in a tensor), shape (# of dimensions and size of each dimension), data type (data type of each element in tensor).

### Placeholders and Variables

#### Variables

Best way to represent shared, persistent state manipulated by your program. These are the parameters of the ML model that are altered/trained during the training process. Training variables.

### Placeholders

Way to specify inputs into a graph that hold the place for a Tensor that will be fed at runtime. They are assigned once, do not change after. Input does.

### Popular Architectures

#### Linear Classifier

Takes input features and combines them with weights and biases to predict output value.

#### DNN Classifier

Deep neural net, contains intermediate layers of nodes that represent "hidden features" and activation functions to represent non-linearity.

#### ConvNets

Convolutional neural nets. Popular for image classification.

#### Transfer Learning

Use existing trained models als starting points and add additional layers for the specific use case. Ides is that highly trained existing models know general features that serve as a good starting point for training a small network on specific examples.

#### RNN

Recurrent neural nets, designed for handling a sequence of inputs that have "memory" of the sequence. LSTMs are a fancy version of RNNs, popular for NLP.

#### GAN

General adversaraial neural net, one model creates fake examples, and another model is served both fake example and real examples and is asked to distinguish.

#### Wide and Deep

Combines linear classifiers with deep neural net classifiers, "wide" linear parts represent memorizing specific examples and "deep" parts represent understanding high level features.

## Solutions

### Data Lifecycle

At each stage, GSP offers multiple services to manage your data.

* Ingest: First stage is to pull in the raw dat, such as streaming data from devices, on-premises batch data, application logs, or mobile-app user events and analytics.
* Store: After the data has been retrieved, it needs to be stored in a format that is durable and can be easicly accessed.
* Process and Analyze: The data is transformed from raw from into actionable infromation
* Explore and Viszalize: Convert the results of the analysis into a format that is easy to draw insights from and to share with colleagues and peers.
<a/>

|Ingest|Store|Process & Analyze|Explore & Visualize|
|-|-|-|-|
|App Engine|Cloud Storage|Cloud Dataflow|Cloud Datalab|
|Compute Engine|Cloud SQL|Cloud Dataproc|Cloud Data Studio|
|Kubernetes Engine|Cloud Datastore|BigQuery|Google Sheets|
|Cloud Pub/Sub|Cloud Bigtable|Cloud ML||
|Stackdiver Logging|BigQuery|Cloud Vision API||
|Cloud Transfer Service|Cloud Storage for Firebase|Cloud Speech API||
|Transfer Appliance|Cloud Firestore|Translate API||
||Cloud Spanner|Cloud Natural Language API||
|||Cloud Dataprerp||
|||Cloud Video Intelligence API||

#### Ingest

There are a number of approaches to collect raw data, based on the data's size, source and latency

* Application: Data from application events, log files or user events, typically collected in a push model, where the application calls an API to send the data to storage (Stackdriver Logging, Pub/Sub, Cloud SQL, Datastore, Bigtable, Spanner)
* Streaming: Data consists of a continuous stream of small, asynchronous messages. Common uses include telemetry, or collecting data from geographically dispersed devices (IoT) and user events and analytics (Pub/Sub)
* Batch: Large amounts of data are stored in a set of files that are transferred to storage in bulk. Common use cases include scientific workloads, backups, migration (Storage, Transfer Service, Appliance)

#### Storage

* Cloud Storage: Durable and highly-available object storage for structured and unstrucutred data
* Cloud SQL: Fully managed, cloud RDBMS that offers both MySQL and PostgreSQL engines twith built-in support for replication, for low-latencyj, tansactional, relational database workloads. Supports RDBMS workloads up to 10 TB (storing financial transactions, user credentials, customer orders)
* BigTable: Manged, high-performance NoSQL database servuce designed to terabyte- to petabyte-scale workloads. Suitable for large-scale, high-throughput workloads such as advertising technology or IoT data infrastructure. Does not support multi-row transactions, SQL queries of joins, consider Cloud SQL or Cloud Datastore instead.
* Cloud Spanner: Fully managed relational database service for missoin-critical OLTP applications. Horizontally scalable, and built for strong consistency, high availability, and global scal. Supports schemas, ACID transactions, and SQL queries (use for retail and global supply chain ad tech, financial services)
* Big Query: jSotres large quantities of data for query and anaylsis instead of transactional processing.
<a/>

