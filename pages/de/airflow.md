# Apache Airflow

Helps you to manage Datepipelines. [Airflow vs Beam](https://www.astronomer.io/blog/airflow-vs-apache-beam/).  

Apache Airflow is an open source platform to programmatically author, schedule and monitor workflows.

* Dynamic: Coded in Python
* Scalable: Execute as many tasks as necessary
* UI: Monitor Tasks and Pipelines
* Extensibility: Create Plugins
<a/>

    Download Data > Process Data > Store Data
          |               |            |
         API            Spark    Insert/Update

Airflow is not:
* Data Streaming Solution > Beam
* Data Processing framework > Spark, Flink ...
<a/>

## Core Concepts

### Components

* Webserver: UI
* Scheduler: Demon in charge of scheduling workflow
* Metastore: Database, where metadata is stored
* Executor: Class defining how your tasks should be executed
* Worker: Process executing your task
<a/>

### DAG

Directed Acyclig Graph. Datapipeline. Nodes are Tasks. Edges are Dependencies.

    T1 \
    T2 - T4
    T3 /
    
### Operator

Task in datapipeline.

    db = connecT(host, credentials)
    db.insert(sql_request)

#### Action Operations

Operators in charge of executing something (Python, Bash, SQL ...)

#### Transfer Operators

Transfer data from a source to a destination

#### Sensors

Wait for condition to be met to happen, before doing something.

#### Task Instance

Instance of the opertator in DAG

#### Workflow

Combination of operatotr and dependencies in a DAG.

## How Airflow works

### One Node Architecture

[Airflow](../../img/airflow_1.jpg)

### Multi Node Arichtitecture (Celery)

[Airflow](../../img/airflow_2.jpg)

[Airflow](../../img/airflow_3.jpg)

### Providers vs Extras

Provider gives you new functionality (operators). Extras are only dependencies.
