https://cloud.google.com/certification/data-engineer

> Low-cost one-way one-time migration of two 100-TB file servers to Google Cldoud; data will be frequently accessed and only from Germany.

1. X Use Transfer Applicance. Transfer to a Cloud Storage Standard bucket.
2. Use Storage Transfer Service. Ttransfer to a Cloud Storage Standard bucket.
3. Use Transfer Applicance. Transfer to a Cloud Storage Nearline bucket.
4. Use Storage Transfer Service. Transfer to a Cloud Storage Coldline bucket.

A is correct because you are performing a one-time (rather than an ongoing services) data transfer from on-premises to Google Cloud for users in a single region (Germany). Using a  Standard storage bucket is best for data is frequently accessed, will reduce cost and also best for data that is frequently accessed, will reduce cost and also conform to regulatory requirements. B is not correct because you should only use Transfer Service for a one-time one-way transfer. Also, Storage Transfer Service does not work for data stored on-premises.

> A Data Analyst is concerned that a BigQuery query clould be too expensive.

1. Use the LIMIT clause to limit the number of values in the results.
2. Set the Maximum Bytes Billed, which will limit the number of bytes processed but still run the query if the number of bytes requested goes over the limit.
3. X Use the SELECT clause to limit the amount of data in the query. Partition data by date so the query can be more focused.
4. Use Group by so the results will be grouped into fewer output values.

C is correct. SELECT limits the input data. A is not correct because the LIMIT clause limits the output, but does not limit data processes.

> 250,000 devices produce a JSON device status every 10 Seconds. How do you capture event data for outlier time series analysis?

1. Capture data in BigQuery. Develop a BigQuery API custom application to query the dataset and display device outlier data.
2. X Capture data in Cloud Bigtable. Use Cloud BigTable cbt tool to display device outlier data.
3. Capture data in BigQuery. Use Biguery console to query the dateset and display device outlier data.
4. Capture data in Cloud BigTable. Install and use HBase shell for cloud BigTable to query the table for device outlier data.

B is correct because the data type, volume, and query pattern best fit Cloud Bigtable capabilities. C is not correct because you do not need to use BigQuery for the query pattern in this scenario. The focus is on a single action (identify outliers), not an interactive analysis. And the speed of the data is more suited for Cloud BigTable.

> BigQuery data is stored in external CSV files in Cloud Storage; as the data has invreased, the query performance has dropped.

1. X Import the data into BigQuery for better performance
2. Divide the data into partitions based on the data.
3. Request more slots for greater capacity to improve performance.
4. Time to move to Cloud BigTable; it is faster in all cases.

A Is correct. The performance issue is because the dta is stored in a non-optimal format in an external storage medium.

> A client has been developing a pipeline based on PCollections using local programming techniques and is ready to scale up to production. What should they do?

1. X They should use the Dataflow Cloud Runner.
2. They should use the local version of the runner.
3. They should upload the pipeline to Dataproc.
4. Import the pipeline into BigQuery.

A is correct. The PCollectoin indicates it is a Dataflow pipeline. And the Cloud Runner will enable to scale to production levels.

> Host a deep neural network machine learning model on Google Cloud. Run and monitor jobs that could occasionally fail.

1. Use AI Platform (Vertex AI) to host you model. Monitor the status of the Operation object for 'error' results.
2. Use a Google Kubernetes Engine cluster to host you model. Monitor the status of the Jobs object for 'failed' job states.
3. X Use AI Platform (Vertex AI) to host your model. Monitor the status of the Jobs object for 'failed' job states.
4. Use a Google Kubernetes Engine cluster to host your model. Monitor the status of the Operation object for 'error' results.

C is correct because of the requirement to host an ML DNN. Vertex AI for Tensorflow can handle DNNs. Google recommends monitoring Jobs, not Operations.

> Three Google Cloud services commonly used together in data engineering solutions

1. Dataproc, Cloud SQL, BigQuery
2. Pub/Sub, Kubvernetes Engine Cloud Spanner
3. X Pub/Sub, Dataflow, BigQuery
4. Cloud BigTable, Dataproc, Cloud Spanner

C is correct. Pub/Sub provides messaging, Dataflow is used for ETL and data transformation, and BigQuery is used for interactive queries.

> You want to minimize costs to run Google Data Studio reports on BigQuery queries by using prefetch caching.

1. Set up the report to use the Owner's credentials to access the underlying data in BigQuery, and direct the users to view the report only once per business day.
2. Set up the report to use the Viewer's credentials to access the underlying data in BigQuery, and also ser it up to be a 'view-only' report.
3. X Set up the report to use the Owner's credentials to access the underlying data in BigQuery, an verify that the 'Enable cache' checkbox is selected in for the report.
4. Set up the report to use the Viewer's credentials to access the underlying data in BigQuery, and verify that the 'Enable cache' checkbox is not selected for the report.

C is correct because you must set Owner credentials to use the 'enable cache' option in BigQuery. It is also a Google best practive to use the 'enable cache' option when the business scenario calls for using prefetch caching. 1) Report must use Owner's Credentials. 2) You don't need to tell the users not to use the report, you need to tell the system to use Query and Pre-fetch caching to cut down on BigQuery jobs.

> What is AVRO used for?

1. X Serialization and de-serialization of data so that it can be transmitted and stored while maintaining an object structure.
2. AVRO ist a file type usually specified with \*.avr and a common format for spreadsheets.
3. AVRO is an encryption method. AVRO-256 is a 256-bit key standard.
4. AVRO is a numerical type in SQL that stores a 38 digit value with 9 digit decimal representation. It avoids rounding errors in financial calculations.

A is correct. AVRO is a serialization / de-serialization standard. B is not correct. AVRO is not a file format. It is a serialization method.

> Customer wants to maintain investment in an existing Apache Spark code data pipeline.

1. DigQuery
2. X Dataproc
3. Dataflow
4. Dataprerp

B is correct because Dataproc is a managed Hadoop service and runs Apacke Spark applications.

> Promote a Cloud BigTable solution with a lot of data from develoopment to production and optimize for performance.

1. Change your Cloud BigTable instance type from Development to Production, and set the number of nodes to a least 3. Verify that the storage type is HDD.
2. Export the data from your current Cloud BigTable instance to Cloud Storage. Create a new Cloud BigTable Production instance type with a least 3 nodes. Select the HDD storage type. Import the data into the new instance from Cloud Storage.
3. X Change your Cloud Bigtable instance type from Development to Production, and set the number of nodes to at least 3. Verify that the storage type is SSD.
4. Export the data from your current Cloud BigTable instance to Cloud Storage. Create a new Cloud BigTable Production instance type with a least 3 nodes. Select the SSD storage type. Import the data into the new instance from Cloud Storage.

C is correct because Cloud Bigtable allows you to 'scale in place' which meets your requirements for this scenario.

> A company wants to connect cloud applications to an Oracle databese in its data center. Requirements are a maximum of 9 Gbps of data and a Service Level Agreements (SLA) of 99%
 
1. Implement a high-throughput Cloud VPN connection
2. Dedicated Interconnect
3. Cloud Router with VPN
4. X Partner Interconnect

A is correct. Partner Interconenct is useful for data up to 10 Gbps and is offered by ISPs with SLAs. B is not correct. Direct Interconnect is useful for data from 10 Gbps to 80 Gbps. An ISP could offer a 99% SLA, but the max 9 Gbps requirement means this solution would not be optimal. A is not correct. Cloud VPN traverses the public internet. It is useful for low-volume connections. The SLA offered by Google covers the Cloud VPN service itself, and not the internet transport. So it would not meet the SLA requirement.

> Source data is streamed in bursts and must be transformed before use.

1. Use Cloud Bigtable for fast input and cbt for ETL
2. Use Pub/Sub to buffer the data, and then use BigQuery for ETL.
3. Ingest data to Cloud Storage. Use Dataproc for ETL.
4. X Use Pub/Sub to buffer the data, and then use Dataflow for ETL.

D is correct because the unpredictable data requires a buffer.

> A cllient wants to store files from one location and retrieve them from another location. Security requirements are that no one should be able to access the contants of the file while it is hosted in the cloud. What is the best option?

1. Default encryption should be sufficient
2. Customer-Supplied Encryption Keys (CSEK)
3. X Client-side encryption
4. Customer Managed Encryption Keys (CMEK)

C is correct. The requirement is that the file cannot be decrypted in the cloud, so encrypt it before it is uploaded and after it is downloaded adds a layer of encryption. A is wrong, because the file will be readable within the project. D is not correct. The file can still be decrypted while hosted in the cloud

> A company has a new IoT Pipeline. Which services will make this design work? Select the services that should be used to replace the icons with the number "1" and "2" in the diagram

![Exam](../../../img/de_exam_65.jpg)

1. IoT Core, Datastore
2. X IoT Core, Pub/Sub
3. Pub/Sub, Cloud Storeage
4. App Engine, IoT Core

B is correct because device data captured by IoT Core gets published to Pub/Sub. C is not correct, because Pub/Sub does not do device management.

> Calculate a runnig average of streaming data that can arrive late and out of order

1. X Use Pub/Sub and Dataflow with Sliding Time Windows.
2. Pub/Sub can guarantee timely arrical and order.
3. Use Pub/Sub and Google Data Studio.
4. Use Dataflow's built-in timestamps for ordering and filtering

A is correct because together, Pub/Sub and Dataflow can provide a solution.

> Storage of JSON files with occasionally changing schema, for ANSI SQL queries.

1. Store in BigQuery. Provide format files for data load an update them as needed.
2. X Store in Cloud Storage. Link data as temporary tables in BigQuery and turn on the "Automatically detect" option in the Schema section of BigQuery.
3. Store in BigQuery. Select "Automatically detect" in the Schema section.
4. Store in Cloud Storage. Link data as permanenet tables in BigQuery and turn on the "Automatically detect" option in the Schema section of BigQuery.

B is correct because of the requirement to support occasionally (schema) changing JSON files an aggregate ANSI SQL queries: you need to use BigQuery, and it is quickest to use 'Automatically detect' for schema changes. D is not correct because you should not use Cloud Storage for this scenario: it is cumbersome and doesn't add value.

> Testing a Machine Learning model with validatoin data returns 100% correct answers.

1. The model is working extremely well, indicating the hyperparameters are set correctly.
2. The model is underfit. There is a problem
3. X The model is overfit. There is a problem
4. The model is perfectly fit. You do not need to continue training.

> A company has migrated their Hadoop cluster to the cloud and is now using Dataproc with the same settings and same methodes as in the data center. What would you advise them to do to make better use of the cloud environment?

1. Upgrade to the latest version of HDFS. Change the settings in Hadoop components to optimize for the different kinds of work in the mix.
2. X Store persistent data off-cluster. Start a cluster for one kind of work then shut it down when it is not processing data.
3. Find more jobs to run so the cluster utilization will cost-justify the expense.
4. Migrate from Dataproc to an open source Hadoop Cluster hosted on Compute Engine, because this is the only way to get all the Hadoop customizations needed for efficiency.

B is correct. Storing persistent data off the cluster allows the cluster to be shut down when not processing data. And it allows separate clusters to be started per job of per kind of work, so tuning is less important.

> Cost-effective backup to Google Cloud of multi-TB databases from another cloud including monthly DR drills.

1. Use Transfer Appliance. Transfer to Cloud Storage Nearline bucket.
2. X Use Storage Transfer Service. Transfer to Cloud Storage Nearline bucket.
3. Use Transfer Appliance. Transfer to Cloud Storage Coldline bucket.
4. Use Storage Transfer Service. Transfer to Cloud Storage Coldline bucket.

B is correct because you will need to access you backup data monthly to test your disaster recovery process, so you should use a Nearline bucket; also because you will be performing ongoing, regular data transfers, so you should use Storage Transfer Services. D is not correct because you should not use Coldline if you want to access the files monthly.

> As part of your backup plan, you want to be able  to restore snapshots of Compute Engine instances using the fewest steps.

1. Export the snapshots to Cloud Storage. Create disks from the exported snapshot files. Create images from the new disks.
2. Use the snapshots to create replacement disks. Use the disks to create instances as needed.
3. Export the snapshots to Cloud Storage. Create images from the exported snapshot files.
4. X Use the snapshots to create replacement instances as needed.

> Cost-effective way to run non-critical Apache Spark jobs on Dataproc?

1. Set up a cluster in high availability mode with high-memory machine types. Add 10 additional local SSDs.
2. X Set up a cluster in standard mode with high-memory machine types. Add 10 additional preemptible worker nodes.
3. Set up a cluster in high availability mode with default machine types. Add 10 additional preemptible worker nodes.
4. Set up a cluster in standard mode with the default machine types. Add 10 additional local SSDs.

B is correct because Spark and high-memory machines only need the standared mode. Also, use prremptible nodes because you want to save money and this is not mission-critical.

> A client is using Cloud SQL database to serve infrequently changing lookup tables that host data used by applications. The applications will not modify the tables. As they expand into other geographic regions they want to ensure good performance. What fo you recommend?

1. Migrate to Cloud Spanner
2. Instance high availability configuration
3. X Read replicas
4. Replicate from an external server

C is correct. A read replica will increase the availability of the service and can be located closer to the users in the new geographiers. A is not correct because there is no mention of a scale issue requiring a larger database of globally consistent transactions.

> Event data in CSV format to be queried for individual values over time windows. Which storage and schema to minimize query costs?

1. X Use Cloud Bigtable. Design tall and narrow tables, and use a new row for each single event version.
2. Use Cloud Storage. Join the raw file data with a BigQuery log table.
3. Use Cloud BigTable. Design short and wide tables, and use a new column for each single event version.
4. Use Cloud Storage. Write a Dataprep job to split the data into partitioned tables.

A is correct because it is a recommended best practice. Use Cloud Bigtable and this schema for this scenario. Cloud Storage would have cheaper Storage costs than Cloud Bigtable, but we want to minimize Query Costs. D is not correct because you do not need to use Google Cloud Storage for this scenario. It might be chraper for storage, but not for processing.

> An application has the following data requirements. 1. It requires strongly consistent transactions 2. Total data will be less than 500 GB. 3. The data does not need to be straming or real time. Which dta technology would fit these requirements?

1. BigQuery
2. X Cloud SQL
3. Cloud BigTable
4. Memorystore

B is correct. Cloud SQL supports strongly consistent transactions. And the size requirements will fit with a Cloud SQL instance. C is not correct. Cloud BigTable is not designed to support strongly consistent transactions.















> You are building storage for files for a data pipeline on Google Cloud. You want to support JSON files. The schema of these files will occasionally change. Your analyst teams will use running aggregate ANSI SQL queries on this data. What should you do?

1. O Use BigQuery for storage. Provide format files for data load. Update the format files as needed.
2. X Use BigQuery for storage. Select "Automatically detect" in the Schema section.
3. O Use Cloud Storage for storage. Link data as temporary tables in BigQuery and turn on the "Automatically detect" option in the Schema section of BigQuery. 
4. O Use Cloud Storage for storage. Link data as permanent tables in BigQuery and turn on the "Automatically detect" option in the Schema section of BigQuery.

B is correct because of the requirement to support occasionally (schema) changing JSON files and aggregate ANSI SQL queries: you need to use BigQuery, and it is quickest to use 'Automatically detect' for schema changes.
A is not correct because you should not provide format files: you can simply turn on the 'Automatically detect' schema changes flag.
C, D are not correct because you should not use Cloud Storage for this scenario: it is cumbersome and doesn't add value.

> You use a Hadoop cluster both for serving analytics and for processing and transforming data. The data is currently stored on HDFS in Parquet format. The data processing jobs run for 6 hours each night. Analytics users can access the system 24 hours a day. Phase 1 is to quickly migrate the entire Hadoop environment without a major re-architecture. Phase 2 will include migrating to BigQuery for analytics and to Dataflow for data processing. You want to make the future migration to BigQuery and Dataflow easier by following Google-recommended practices and managed services. What should you do?

1. O Lift and shift Hadoop/HDFS to Dataproc.
2. O Lift and shift Hadoop/HDFS to Compute Engine.
3. O Create a single Dataproc cluster to support both analytics and data processing, and point it at a Cloud Storage bucket that contains the Parquet files that were previously stored on HDFS.
4. X Create separate Dataproc clusters to support analytics and data processing, and point both at the same Cloud Storage bucket that contains the Parquet files that were previously stored on HDFS.

A is not correct because it is not recommended to attach persistent HDFS to Dataproc clusters in Google Cloud. (see references link)
B Is not correct because they want to leverage managed services which would mean Dataproc.
C is not correct because it is recommended that Dataproc clusters be job specific.
D Is correct because it leverages a managed service (Dataproc), the data is stored on Cloud Storage in Parquet format which can easily be loaded into BigQuery in the future and the Dataproc clusters are job specific.
 
You are building a new real-time data warehouse for your company and will use BigQuery streaming inserts. There is no guarantee that data will only be sent in once but you do have a unique ID for each row of data and an event timestamp. You want to ensure that duplicates are not included while interactively querying data. Which query type should you use?
1. O Include ORDER BY DESC on timestamp column and LIMIT to 1.
2. O Use GROUP BY on the unique ID column and timestamp column and SUM on the values.
3. O Use the LAG window function with PARTITION by unique ID along with WHERE LAG IS NOT NULL.
4. X Use the ROW_NUMBER window function with PARTITION by unique ID along with WHERE row equals 1. 
>A is not correct because this will just return one row.
B is not correct because this doesn’t get you the latest value, but will get you a sum of the same event over time which doesn’t make too much sense if you have duplicates.
C is not correct because if you have events that are not duplicated, it will be excluded.
D is correct because it will just pick out a single row for each set of duplicates.

You are designing a streaming pipeline for ingesting player interaction data for a mobile game. You want the pipeline to handle out-of-order data delayed up to 15 minutes on a per-player basis and exponential growth in global users. What should you do?
1. X Design a Dataflow streaming pipeline with session windowing and a minimum gap duration of 15 minutes. Use "individual player" as the key. Use Pub/Sub as a message bus for ingestion.
2. O Design a Dataflow streaming pipeline with session windowing and a minimum gap duration of 15 minutes. Use "individual player" as the key. Use Apache Kafka as a message bus for ingestion.
3. O Design a Dataflow streaming pipeline with a single global window of 15 minutes. Use Pub/Sub as a message bus for ingestion.
4. O Design a Dataflow streaming pipeline with a single global window of 15 minutes. Use Apache Kafka as a message bus for ingestion.
>A Is correct because the question requires delay be handled on a per-player basis and session windowing will do that. Pub/Sub handles the need to scale exponentially with traffic coming from around the globe.
B Is not correct because Apache Kafka will not be able to handle an exponential growth in users globally as well as Pub/Sub.
C is not correct because a global window does not meet the requirements of handling out-of-order delay on a per-player basis.
D is not correct because a global window does not meet the requirements of handling out-of-order delay on a per-player basis.

Your company is loading CSV files into BigQuery. The data is fully imported successfully; however, the imported data is not matching byte-to-byte to the source file. What is the most likely cause of this problem?
1. O The CSV data loaded in BigQuery is not flagged as CSV.
2. O The CSV data had invalid rows that were skipped on import.
3. X The CSV data loaded in BigQuery is not using BigQuery’s default encoding.
4. O The CSV data has not gone through an ETL phase before loading into BigQuery.
>A is not correct because if another data format other than CSV was selected then the data would not import successfully.
B is not correct because the data was fully imported meaning no rows were skipped.
C is correct because this is the only situation that would cause successful import.
D is not correct because whether the data has been previously transformed will not affect whether the source file will match the BigQuery table.

Your company is migrating their 30-node Apache Hadoop cluster to the cloud. They want to re-use Hadoop jobs they have already created and minimize the management of the cluster as much as possible. They also want to be able to persist data beyond the life of the cluster. What should you do?
1. O Create a Dataflow job to process the data.
2. O Create a Dataproc cluster that uses persistent disks for HDFS.
3. O Create a Hadoop cluster on Compute Engine that uses persistent disks.
4. X Create a Dataproc cluster that uses the Cloud Storage connector.
5. O Create a Hadoop cluster on Compute Engine that uses Local SSD disks.
> A is not correct because the goal is to re-use their Hadoop jobs and MapReduce and/or Spark jobs cannot simply be moved to Dataflow.
B is not correct because the goal is to persist the data beyond the life of the ephemeral clusters, and if HDFS is used as the primary attached storage mechanism, it will also disappear at the end of the cluster’s life.
C is not correct because the goal is to use managed services as much as possible, and this is the opposite.
D is correct because it uses managed services, and also allows for the data to persist on GCS beyond the life of the cluster.
E is not correct because of the same reasons as option C.

> You have 250,000 devices which produce a JSON device status event every 10 seconds. You want to capture this event data for outlier time series analysis. What should you do?

1. Ship the data into BigQuery. Develop a custom application that uses the BigQuery API to query the dataset and displays device outlier data based on your business requirements.
2. Ship the data into BigQuery. Use the BigQuery console to query the dataset and display device outlier data based on your business requirements.
3. X Ship the data into Cloud Bigtable. Use the Cloud Bigtable cbt tool to display device outlier data based on your business requirements.
4. Ship the data into Cloud Bigtable. Install and use the HBase shell for Cloud Bigtable to query the table for device outlier data based on your business requirements.

C is correct because the data type, volume, and query pattern best fits BigTable capabilities and also Google best practices as linked below.
A, B are not correct because you do not need to use BigQuery for the query pattern in this scenario.
D is not correct because you can use the simpler method of 'cbt tool' to support this scenario.  
[Best Practice](https://cloud.google.com/bigtable/docs/go/cbt-overview)  

You are selecting a messaging service for log messages that must include final result message ordering as part of building a data pipeline on Google Cloud. You want to stream input for 5 days and be able to query the current status. You will be storing the data in a searchable repository. How should you set up the input messages?
1. X Use Pub/Sub for input. Attach a timestamp to every message in the publisher.
2. O Use Pub/Sub for input. Attach a unique identifier to every message in the publisher.
3. O Use Apache Kafka on Compute Engine for input. Attach a timestamp to every message in the publisher.
4. O Use Apache Kafka on Compute Engine for input. Attach a unique identifier to every message in the publisher.
>A is correct because of recommended Google practices; see the links below.
B is not correct because you should not attach a GUID to each message to support the scenario.
C, D are not correct because you should not use Apache Kafka for this scenario (it is overly complex compared to using Pub/Sub, which can support all of the requirements).  
[Best Practice](http://www.jesse-anderson.com/2016/07/apache-kafka-and-google-cloud-pubsub/)  

You want to publish system metrics to Google Cloud from a large number of on-prem hypervisors and VMs for analysis and creation of dashboards. You have an existing custom monitoring agent deployed to all the hypervisors and your on-prem metrics system is unable to handle the load. You want to design a system that can collect and store metrics at scale. You don't want to manage your own time series database. Metrics from all agents should be written to the same table but agents must not have permission to modify or read data written by other agents. What should you do?
1. X Modify the monitoring agent to publish protobuf messages to Pub/Sub. Use a Dataproc cluster or Dataflow job to consume messages from Pub/Sub and write to BigTable.
2. O Modify the monitoring agent to write protobuf messages directly to BigTable.
3. O Modify the monitoring agent to write protobuf messages to HBase deployed on Compute Engine VM Instances
4. O Modify the monitoring agent to write protobuf messages to Pub/Sub. Use a Dataproc cluster or Dataflow job to consume messages from Pub/Sub and write to Cassandra deployed on Compute Engine VM Instances.
>A Is correct because Bigtable can store and analyze time series data, and the solution is using managed services which is what the requirements are calling for.
B Is not correct because BigTable cannot limit access to specific tables.
C is not correct because it requires deployment of an HBase cluster.
D is not correct because it requires deployment of a Cassandra cluster.
  
You are designing storage for CSV files and using an I/O-intensive custom Apache Spark transform as part of deploying a data pipeline on Google Cloud. You intend to use ANSI SQL to run queries for your analysts. How should you transform the input data?
1. O Use BigQuery for storage. Use Dataflow to run the transformations.
2. X Use BigQuery for storage. Use Dataproc to run the transformations.
3. O Use Cloud Storage for storage. Use Dataflow to run the transformations.
4. O Use Cloud Storage for storage. Use Dataproc to run the transformations.
>B is correct because of the requirement to use custom Spark transforms; use Dataproc. ANSI SQL queries require the use of BigQuery.
A is not correct because Dataflow does not support Spark.
C, D are not correct because Cloud Storage does not support SQL, and you should not use Dataflow, either.  
[Best Practice](https://stackoverflow.com/questions/46436794/what-is-the-difference-between-google-cloud-dataflow-and-google-cloud-dataproc)  

You are designing a relational data repository on Google Cloud to grow as needed. The data will be transactionally consistent and added from any location in the world. You want to monitor and adjust node count for input traffic, which can spike unpredictably. What should you do?
1. O Use Cloud Spanner for storage. Monitor storage usage and increase node count if more than 70% utilized.
2. X Use Cloud Spanner for storage. Monitor CPU utilization and increase node count if more than 70% utilized for your time span.
3. O Use Cloud Bigtable for storage. Monitor data stored and increase node count if more than 70% utilized.
4. O Use Cloud Bigtable for storage. Monitor CPU utilization and increase node count if more than 70% utilized for your time span.
>B is correct because of the requirement to globally scalable transactions—use Cloud Spanner. CPU utilization is the recommended metric for scaling, per Google best practices, linked below.
A is not correct because you should not use storage utilization as a scaling metric.
C, D are not correct because you should not use Cloud Bigtable for this scenario.  
[Best Practice](https://cloud.google.com/spanner/docs/monitoring)  

You have a Spark application that writes data to Cloud Storage in Parquet format. You scheduled the application to run daily using DataProcSparkOperator and Apache Airflow DAG by Cloud Composer. You want to add tasks to the DAG to make the data available to BigQuery users. You want to maximize query speed and configure partitioning and clustering on the table. What should you do?
1. O Use "BashOperator" to call "bq insert".
2. O Use "BashOperator" to call "bq cp" with the "--append" flag.
3. X Use "GoogleCloudStorageToBigQueryOperator" with "schema_object" pointing to a schema JSON in Cloud Storage and "source_format" set to "PARQUET".
4. O Use "BigQueryCreateExternalTableOperator" with "schema_object" pointing to a schema JSON in Cloud Storage and "source_format" set to "PARQUET".
>B Is not correct because bq cp is for existing BigQuery tables only
A Is not correct because bq insert will not set the partitioning and clustering and only supports JSON
C is correct because it loads the data and sets partitioning and clustering
D is not correct because an external table will not satisfy the query speed requirement  
[Best Practice](https://cloud.google.com/bigquery/docs/loading-data)  

You have a website that tracks page visits for each user and then creates a Pub/Sub message with the session ID and URL of the page. You want to create a Dataflow pipeline that sums the total number of pages visited by each user and writes the result to BigQuery. User sessions timeout after 30 minutes. Which type of Dataflow window should you choose?
1. O A single global window
2. O Fixed-time windows with a duration of 30 minutes
3. X Session-based windows with a gap duration of 30 minutes
4. O Sliding-time windows with a duration of 30 minutes and a new window every 5 minute
>B. There is no per-user metric being used so it’s possible a sum will be created for some users while they are still browsing the site.
D. If a user is still visiting the site when the 30-min window closes, the sum will be wrong.
C. This is correct because it continues to sum user page visits during their browsing session and completes at the same time as the session timeout.
A. A user-specific sum is never calculated, just sums for arbitrary 30-min windows of time staggered by 5 minutes.  
[Best Practice](https://cloud.google.com/dataflow/docs/resources)  

You are designing a basket abandonment system for an ecommerce company. The system will send a message to a user based on these rules: a). No interaction by the user on the site for 1 hour b). Has added more than $30 worth of products to the basket c). Has not completed a transaction. You use Dataflow to process the data and decide if a message should be sent. How should you design the pipeline?
1. O Use a fixed-time window with a duration of 60 minutes.
2. O Use a sliding time window with a duration of 60 minutes.
3. X Use a session window with a gap time duration of 60 minutes.
4. O Use a global window with a time based trigger with a delay of 60 minutes.
>A is not correct because assuming there is one key per user, a message will be sent every 60 minutes.
B is not correct because assuming there is one key per user, a message will be sent 60 minutes after they first started browsing even if they are still browsing.
C is correct because it will send a message per user after that user is inactive for 60 minutes.
D is not correct because it will cause messages to be sent out every 60 minutes to all users regardless of where they are in their current session.  
[Best Practice](https://beam.apache.org/documentation/programming-guide/#windowing)  

You need to stream time-series data in Avro format, and then write this to both BigQuery and Cloud Bigtable simultaneously using Dataflow. You want to achieve minimal end-to-end latency. Your business requirements state this needs to be completed as quickly as possible. What should you do?
1. O Create a pipeline and use ParDo transform.
2. O Create a pipeline that groups the data into a PCollection and uses the Combine transform.
3. X Create a pipeline that groups data using a PCollection and then uses Bigtable and BigQueryIO transforms.
4. O Create a pipeline that groups data using a PCollection, and then use Avro I/O transform to write to Cloud Storage. After the data is written, load the data from Cloud Storage into BigQuery and Bigtable.
>A Is not correct because ParDo doesn’t write to BigQuery or BigTable
B Is not correct because Combine doesn’t write to BigQuery or Bigtable
C Is correct because this is the right set of transformations that accepts and writes to the required data stores.
D Is not correct because to meet the business requirements, it is much faster and easier using dataflow answer C  
[Best Practice](https://cloud.google.com/blog/products/gcp/guide-to-common-cloud-dataflow-use-case-patterns-part-1)  

Your company’s on-premises Apache Hadoop servers are approaching end-of-life, and IT has decided to migrate the cluster to Dataproc. A like-for-like migration of the cluster would require 50 TB of Google Persistent Disk per node. The CIO is concerned about the cost of using that much block storage. You want to minimize the storage cost of the migration. What should you do?
1. X Put the data into Cloud Storage.
2. O Use preemptible virtual machines (VMs) for the Dataproc cluster.
3. O Tune the Dataproc cluster so that there is just enough disk for all data.
4. O Migrate some of the cold data into Cloud Storage, and keep only the hot data in Persistent Disk.
>A is correct because Google recommends using Cloud Storage instead of HDFS as it is much more cost effective especially when jobs aren’t running.
B is not correct because this will decrease the compute cost but not the storage cost.
C is not correct because while this will reduce cost somewhat, it will not be as cost effective as using Cloud Storage.
D is not correct because while this will reduce cost somewhat, it will not be as cost effective as using Cloud Storage.  
[Best Practice](https://cloud.google.com/dataproc/docs/concepts/connectors/cloud-storage)  

You are designing storage for two relational tables that are part of a 10-TB database on Google Cloud. You want to support transactions that scale horizontally. You also want to optimize data for range queries on non-key columns. What should you do?
1. O Use Cloud SQL for storage. Add secondary indexes to support query patterns.
2. O Use Cloud SQL for storage. Use Dataflow to transform data to support query patterns.
3. X Use Cloud Spanner for storage. Add secondary indexes to support query patterns.
4. O Use Cloud Spanner for storage. Use Dataflow to transform data to support query patterns.
>A is not correct because Cloud SQL does not natively scale horizontally.
B is not correct because Cloud SQL does not natively scale horizontally.
C is correct because Cloud Spanner scales horizontally, and you can create secondary indexes for the range queries that are required.
D is not correct because Dataflow is a data pipelining tool to move and transform data, but the use case is centered around querying.  

Your company is streaming real-time sensor data from their factory floor into Bigtable and they have noticed extremely poor performance. How should the row key be redesigned to improve Bigtable performance on queries that populate real-time dashboards?
1. O Use a row key of the form <timestamp>.
2. O Use a row key of the form <sensorid>.
3. O Use a row key of the form <timestamp>#<sensorid>.
4. X Use a row key of the form <sensorid>#<timestamp>.
>A is not correct because this will cause most writes to be pushed to a single node (known as hotspotting)
B is not correct because this will not allow for multiple readings from the same sensor as new readings will overwrite old ones.
C is not correct because this will cause most writes to be pushed to a single node (known as hotspotting)
D is correct because it will allow for retrieval of data based on both sensor id and timestamp but without causing hotspotting.  
[Best Practice](https://cloud.google.com/bigtable/docs/schema-design)  
  
You are developing an application on Google Cloud that will automatically generate subject labels for users’ blog posts. You are under competitive pressure to add this feature quickly, and you have no additional developer resources. No one on your team has experience with machine learning. What should you do?
1. X Call the Cloud Natural Language API from your application. Process the generated Entity Analysis as labels.
2. O Call the Cloud Natural Language API from your application. Process the generated Sentiment Analysis as labels.
3. O Build and train a text classification model using TensorFlow. Deploy the model using AI Platform Prediction. Call the model from your application and process the results as labels.
4. O Build and train a text classification model using TensorFlow. Deploy the model using a Kubernetes Engine cluster. Call the model from your application and process the results as labels.
>A is correct because it provides a managed service and a fully trained model, and the user is pulling the entities, which is the right label.
B is not correct because sentiment is the incorrect label for this use case.
C is not correct because this requires experience with machine learning.
D is not correct because this requires experience with machine learning.  

Your company is using WILDCARD tables to query data across multiple tables with similar names. The SQL statement is currently failing with the error shown below. Which table name will make the SQL statement work correctly?
Captionless Image

    # Syntax error: Expected end of statement but got "-" at [4:11]
    
    select
      age
    from
      bigquery-public-data.noaa_gsod.gsod
    where
      age != 99
      and _table_suffix = '1929'
    order by
      age desc

1. O `bigquery-public-data.noaa_gsod.gsod`
2. O bigquery-public-data.noaa_gsod.gsod*
3. O ‘bigquery-public-data.noaa_gsod.gsod*’
4. X `bigquery-public-data.noaa_gsod.gsod*`
>A is not correct because this is not the correct wildcard syntax as there is no wildcard character present.
B is not correct because this is not the correct wildcard syntax since it’s missing backticks.
C is not correct because this is not the correct wildcard syntax since it’s not using a backtick as the last character
D is correct because it follows the correct wildcard syntax of enclosing the table name in backticks and including the * wildcard character.
 
You are working on an ML-based application that will transcribe conversations between manufacturing workers. These conversations are in English and between 30-40 sec long. Conversation recordings come from old enterprise radio sets that have a low sampling rate of 8000 Hz, but you have a large dataset of these recorded conversations with their transcriptions. You want to follow Google-recommended practices. How should you proceed with building your application?
1. X Use Cloud Speech-to-Text API, and send requests in a synchronous mode.
2. O Use Cloud Speech-to-Text API, and send requests in an asynchronous mode.
3. O Use Cloud Speech-to-Text API, but resample your captured recordings to a rate of 16000 Hz.
4. O Train your own speech recognition model because you have an uncommon use case and you have a labeled dataset.
>A Is correct because synchronous mode is recommended for short audio files.
B is incorrect since the recommended way to process short audio files (shorter than 1 minutes) is a synchronous recognize request and not an asynchronous one.
C Is incorrect since using the native sample rate is recommended over resampling.
D Is incorrect since there is nothing in the question that suggests the off-the-shelf model will not perform sufficiently.
 
You are developing an application on Google Cloud that will label famous landmarks in users’ photos. You are under competitive pressure to develop a predictive model quickly. You need to keep service costs low. What should you do?
1. O Build an application that calls the Cloud Vision API. Inspect the generated MID values to supply the image labels.
2. X Build an application that calls the Cloud Vision API. Pass landmark location as base64-encoded strings.
3. O Build and train a classification model with TensorFlow. Deploy the model using AI Platform Prediction. Pass client image locations as base64-encoded strings.
4. O Build and train a classification model with TensorFlow. Deploy the model using AI Platform Prediction. Inspect the generated MID values to supply the image labels.
>B is correct because of the requirement to quickly develop a model that generates landmark labels from photos.
This is supported in Cloud Vision API; see the link below.
A is not correct because you should not inspect the generated MID values; instead, you should simply pass the image locations to the API and use the labels, which are output.
C, D are not correct because you should not build a custom classification TF model for this scenario.  
 
You are building a data pipeline on Google Cloud. You need to select services that will host a deep neural network machine-learning model also hosted on Google Cloud. You also need to monitor and run jobs that could occasionally fail. What should you do?
1. O Use AI Platform Prediction to host your model. Monitor the status of the Operation object for 'error' results.
2. X Use AI Platform Prediction to host your model. Monitor the status of the Jobs object for 'failed' job states.
3. O Use a Google Kubernetes Engine cluster to host your model. Monitor the status of the Jobs object for 'failed' job states.
4. O Use a Google Kubernetes Engine cluster to host your model. Monitor the status of Operation object for 'error' results.
>B is correct because of the requirement to host an ML DNN and Google-recommended monitoring object (Jobs); see the links below.
A is not correct because you should not use the Operation object to monitor failures.
C, D are not correct because you should not use a Kubernetes Engine cluster for this scenario.
 
You work on a regression problem in a natural language processing domain, and you have 
 M labeled examples in your dataset. You have randomly shuffled your data and split your dataset into training and test samples (in a 90/10 ratio). After you have trained the neural network and evaluated your model on a test set, you discover that the root-mean-squared error (RMSE) of your model is twice as high on the train set as on the test set. How should you improve the performance of your model?
1. O Increase the share of the test sample in the train-test split.
2. O Try to collect more data and increase the size of your dataset.
3. O Try out regularization techniques (e.g., dropout or batch normalization) to avoid overfitting.
4. X Increase the complexity of your model by, e.g., introducing an additional layer or increasing the size of vocabularies or n-grams used to avoid underfitting.
>A Is incorrect since test sample is large enough
C Is incorrect since regularization helps to avoid overfitting and we have a clear underfitting case
B is incorrect since dataset is pretty large already, and having more data typically helps with overfitting and not with underfitting
D Is correct since increasing model complexity generally helps when you have an underfitting problem
 
You are using Pub/Sub to stream inventory updates from many point-of-sale (POS) terminals into BigQuery. Each update event has the following information: product identifier "prodSku", change increment "quantityDelta", POS identification "termId", and "messageId" which is created for each push attempt from the terminal. During a network outage, you discovered that duplicated messages were sent, causing the inventory system to over-count the changes. You determine that the terminal application has design problems and may send the same event more than once during push retries. You want to ensure that the inventory update is accurate. What should you do?
1. O Inspect the "publishTime" of each message. Make sure that messages whose "publishTime" values match rows in the BigQuery table are discarded.
2. O Inspect the "messageId" of each message. Make sure that any messages whose "messageId" values match corresponding rows in the BigQuery table are discarded.
3. O Instead of specifying a change increment for "quantityDelta", always use the derived inventory value after the increment has been applied. Name the new attribute "adjustedQuantity".
4. X Add another attribute orderId to the message payload to mark the unique check-out order across all terminals. Make sure that messages whose "orderId" and "prodSku" values match corresponding rows in the BigQuery table are discarded.
>B Is not correct because duplication in this case could be caused by a terminal re-try, in which case messageId could be different for the same event.
A Is not correct because publishTime cannot uniquely identify a message and it does not address push retries.
D is correct because the client application must include a unique identifier to disambiguate possible duplicates due to push retries.
C is not correct because there are many terminals. Calculating the projected inventory values on the terminal introduces a race condition where multiple terminals could update the inventory data simultaneously.
 
You designed a database for patient records as a pilot project to cover a few hundred patients in three clinics. Your design used a single database table to represent all patients and their visits, and you used self-joins to generate reports. The server resource utilization was at 50%. Since then, the scope of the project has expanded. The database table must now store 100 times more patient records. You can no longer run the reports, because they either take too long or they encounter errors with insufficient compute resources. How should you adjust the database design?
1. O Add capacity (memory and disk space) to the database server by the order of 200.
2. O Shard the tables into smaller ones based on date ranges, and only generate reports with pre-specified date ranges.
3. X Normalize the master patient-record table into the patients table and the visits table, and create other necessary tables to avoid self-join.
4. O Partition the table into smaller tables, with one for each clinic. Run queries against the smaller table pairs, and use unions for consolidated reports.
> A is not correct because adding additional compute resources is not a recommended way to resolve database schema problems.
B is not correct because this will reduce the functionality of the database and make running reports more difficult.
C is correct because this option provides the least amount of inconvenience over using pre-specified date ranges or one table per clinic while also increasing performance due to avoiding self-joins.
D is not correct because this will likely increase the number of tables so much that it will be more difficult to generate reports vs. the correct option.
 
Your startup has never implemented a formal security policy. Currently, everyone in the company has access to the datasets stored in BigQuery. Teams have the freedom to use the service as they see fit, and they have not documented their use cases. You have been asked to secure the data warehouse. You need to discover what everyone is doing. What should you do first?
1. X Use Cloud Audit Logs to review data access.
2. O Get the identity and access management (IAM) policy of each table.
3. O Use Cloud Monitoring to see the usage of BigQuery query slots.
4. O Use the Cloud Billing API to see what account the warehouse is being billed to.
>A is correct because this is the best way to get granular access to data showing which users are accessing which data.
B is not correct because we already know that all users already have access to all data, so this information is unlikely to be useful. It will also not show what users have done, just what they can do.
C is not correct because slot usage will not inform security policy.
D is not correct because a billing account is typically shared among many people and will only show the amount of data queried and stored.
 
You created a job which runs daily to import highly sensitive data from an on-premises location to Cloud Storage. You also set up a streaming data insert into Cloud Storage via a Kafka node that is running on a Compute Engine instance. You need to encrypt the data at rest and supply your own encryption key. Your key should not be stored in the Google Cloud. What should you do?
1. O Create a dedicated service account, and use encryption at rest to reference your data stored in Cloud Storage and Compute Engine data as part of your API service calls.
2. O Upload your own encryption key to Cloud Key Management Service, and use it to encrypt your data in Cloud Storage. Use your uploaded encryption key and reference it as part of your API service calls to encrypt your data in the Kafka node hosted on Compute Engine.
3. O Upload your own encryption key to Cloud Key Management Service, and use it to encrypt your data in your Kafka node hosted on Compute Engine.
4. X Supply your own encryption key, and reference it as part of your API service calls to encrypt your data in Cloud Storage and your Kafka node hosted on Compute Engine.
>D is correct because the scenario requires you to use your own key and also to not store your key on Compute Engine, and also this is a Google recommended practice; see the links below.
A is not correct because the scenario states that you must supply your own encryption key instead of using one generated by Google Cloud.
B is not correct because the scenario states that you should use, but not store, your own key with Google Cloud services.
C is not correct because it does not meet the scenario requirement to reference, but not store, your own key with Google Cloud services.
 
You are working on a project with two compliance requirements. The first requirement states that your developers should be able to see the Google Cloud billing charges for only their own projects. The second requirement states that your finance team members can set budgets and view the current charges for all projects in the organization. The finance team should not be able to view the project contents. You want to set permissions. What should you do?
1. O Add the finance team members to the default IAM Owner role. Add the developers to a custom role that allows them to see their own spend only.
2. X Add the finance team members to the Billing Administrator role for each of the billing accounts that they need to manage. Add the developers to the Viewer role for the Project.
3. O Add the developers and finance managers to the Viewer role for the Project.
4. O Add the finance team to the Viewer role for the Project. Add the developers to the Security Reviewer role for each of the billing accounts.
>B is correct because it uses the principle of least privilege for IAM roles; use the Billing Administrator IAM role for that job function.
A, C, D are not correct because it is a best practice to use pre-defined IAM roles when they exist and match your business scenario; see the links below.

An application that relies on Cloud SQL to read infrequently changing data is predicted to grow dramatically. How can you increase capacity for more read-only clients?
 
 1. O Configure high availibility on the primary node
 2. O Establish an external replica in the customer's data center
 3. O Use backups, so you can restore if there is an outage
 4. X Configure [read replicas](https://cloud.google.com/sql/docs/mysql/replication/tips#read-replica
 
 >D is correct. A High availibility does nothing to improce throughput; it makes the service more accessible. B An external replica is more of a backup activity; it does not add to throughput on the cloud. C Backups would not make sense in this scenario.

A BigQuery dataset was located near Tokyo. For efficiency reasons, the company wants the dataset duplicated in Germany.
 
 1. X Change the dataset from a regional location to mulit-region locations, specifying the regions to be included.
 2. O Export the data from BigQuery into a bucket in the new location, an import it into a new dataset at the new location.
 3. O Copy the data from the dataset in the source region to the dataset in the target region using BigQuery commands.
 4. O Export the data from BigQuery into a nerby bucket in Cloud Storage. Copy to a new reginal bucket in Cloud Storgage. Import into the new dataset in the new location.
 
 >D is correct. BigQuery imports an exports data to local or multi-regional buckets in the same location. So you need to use Cloud Storage as an intermediary to transfer the data to the new location.A Datasets are immutable, so the location can't be updated. B BigQuery writes and reads from bearby buckets, so the new location can't read the old location data. C BigQuery doesn't provide a location-to-location move or copy command.
 
Your client wans a tranactionally consistent global retlational repository. You need to be able to monitor and adjust node count for unpredictable traffic spikes.

1. O Use Cloud Spanner. Monitor storage usage and increase node count if more than 70% utilized.
2. X Use Cloud Spanner. Monitor CPU utilization and increase node count if more than 70% utilized for your time span.
3. O Use Cloud Bigtable. Monitor data stored and increase node count if more than 70% utilized.
4. O Use Cloud Bigtable. Monitor CPU utilization and increase node count if more than 70% utilized for you time span.
 
>B is correct because of the requirement to globally scaleable transactions - use Cloud Spanner. CPU utilization is the recommended metric for scaling, per Google best practices, linked below. A is not correct because you should not use storage utilization as a scaling metric. C,D are not correct because you should not use Cloud Bigtable for such a scenario.

Quickly and inexpensively develop an application that sorts product reviews by most favorable to least favorable.
 
1. O Train an entity classification model with TensorFlow. Deploy the model using AI Platform. Use the entity to sort the reviews.
2. O Build an application that performs entity analysis using the Natural Language API. Use the entity to sort the reviews.
3. X Build an application that performs sentiment analysis using the Natural Language API. Use the score and magnitude to sort the reviews.
4. O Train a sentiment regewssion model with Tensorflow. Deploy the model using AI Platform. Use the magnitude to sort the reviews.
 
>C is correct. Use pre-trained model whenever possible. In this case the Natural Language API with sentiment analysis returns score and magnitude of sentimen. A and B are incorrect because they require creating a model insted of using an exising one. D is incorrect because entity analysis will not determine senitment: it recognizes objects, not opinions.

Maximize speed and minimize cost of deploying a TensorFlow machine-learning model on Google Cloud.
 
 1. X Export your trained model to a SavedModel format. Deploy and run your model on AI Platform.
 2. O Export your trained model to a SavedModel format. Deploy and run your model from a Google Kubernetes Engine Cluster.
 3. O Export 2 copies of your trained model to a SavedModel format. Store artifacts in Cloud Storage. Run 1 version on CPUs and another version on GPUs.
 4. O Export 2 copies of your trained model to a SavedModel format. Store artifacts in AI Platform. Run 1 version on CPUs and another version on GPUs.
 
>A is correct because of Google recommended practices; that is "just deploy it". B is not correct because you should not run your model from Google Kubernetes Engine. C and D are not correct because you should not export 2 copies of your trained model, etc. for this scenario.

> Group Analyst 1 and Analyst 2 should not have access to each other's BigQuery data.
 
1. O Place the data in separate tables, and assign appropriate group access.
2. O Analyst 1 and Analyst 2 must be in separate projects, along with the data.
3. X Place the data in separate datesets, and assign appropriate group access.
4. O Place the data in separate tables, but encrypt each table with different group key.
 
C is correct. BigQuery data access is controlled at the dataset level. A is not correct becauer BigQuery does not provide IAM access control to the individual table. B is not correct because the Analyst groups can be in the same project. D is incorrect because encryption does not determine access.
 
> Provide Analyst 3 secure access to BigQuery query results, but not the underlying tables or datasets.
 
1. O Export the query results to a public Cloud Storage bucket.
2. X Create a BigQuery Authorized View and assign a project-level user role to Analyst 3
3. O Assign the bigquery.resultsonly.viewer role to Analyst 3
4. O Create a BigQuery Authorized View and assign an organization-level role to Analyst 3
 
B is correct. You need to copy/store the query results in a separate dataset and provide authorization to view and/or user that dataset. A is not secure. C The readonly.viewer role does not exist AND secure access connot be applied to a query. D An organizational role is too broad and violates the principle of 'least privilege'.
 
> Use Data Studio to visualize YouTube titles and aggregated view counts summarized over 30 days and segmented by Country in the fewst steps.
 
1. O Set up a YouTube data source for your channel data for Data Studio. set Views as the metric and set Video Title as a reporting deimenstion. Set Country Code as a filter.
2. X Set up a YouTube data source for your channel dta for Data Studio. Set Views as the metric, and set Video Title and Country Code as report dimensions.
3. O Export your YouTube views to Cloud Storage. Set up a Cloud Storage data source for Data Studio. Set Views as the metric, and set Video Title as a report dimension. Set Country Code as a filter.
4. O Export your YouTube views to Cloud Storage. Set up a Cloud Storage data source for Data Studio. Set Views as the metric, and set Video Title and Country Code as report dimensions.
 
B is correct because there is no need to export; you can use the existing YouTube data source. Country Code is a dimension because it's a string and should be displayed as such, that is, showing all countries, insted of filtering. A is not correct because you cannot produce a summazized report that meets you business requirements using the options listed. C and D are not correct because you do not need to export data from YouTube to Cloud Storage, you can simply use the exising YouTube data source.
 
