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

## Haddop

### Overview

Data can no longer fit in memory on one machine (monolithic), so a new way of computing was devised using many computers to process the data (distributed). Such a group is called a cluster, which makes up server farms. All of these servers have to be coordinated in the following ways: partition data, coordinate computing tasks, handle fault tolerance/recovery, and allocate capacity to process.  

Hadoo pis an open source distributed processing framework that manages data processing and storage for big data applications running in clusterd systems. It is comprised of 3 main components:
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

