# Google Data Engineering Cheatsheet
Compiled by Maverick Lin (http://mavericklin.com)

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

