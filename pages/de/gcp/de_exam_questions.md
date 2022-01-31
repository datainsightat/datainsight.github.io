https://cloud.google.com/certification/data-engineer

 
You are building storage for files for a data pipeline on Google Cloud. You want to support JSON files. The schema of these files will occasionally change. Your analyst teams will use running aggregate ANSI SQL queries on this data. What should you do?
1. O Use BigQuery for storage. Provide format files for data load. Update the format files as needed.
2. X Use BigQuery for storage. Select "Automatically detect" in the Schema section.
3. O Use Cloud Storage for storage. Link data as temporary tables in BigQuery and turn on the "Automatically detect" option in the Schema section of BigQuery. 
4. O Use Cloud Storage for storage. Link data as permanent tables in BigQuery and turn on the "Automatically detect" option in the Schema section of BigQuery.
>B is correct because of the requirement to support occasionally (schema) changing JSON files and aggregate ANSI SQL queries: you need to use BigQuery, and it is quickest to use 'Automatically detect' for schema changes.
A is not correct because you should not provide format files: you can simply turn on the 'Automatically detect' schema changes flag.
C, D are not correct because you should not use Cloud Storage for this scenario: it is cumbersome and doesn't add value.

You use a Hadoop cluster both for serving analytics and for processing and transforming data. The data is currently stored on HDFS in Parquet format. The data processing jobs run for 6 hours each night. Analytics users can access the system 24 hours a day. Phase 1 is to quickly migrate the entire Hadoop environment without a major re-architecture. Phase 2 will include migrating to BigQuery for analytics and to Dataflow for data processing. You want to make the future migration to BigQuery and Dataflow easier by following Google-recommended practices and managed services. What should you do?
1. O Lift and shift Hadoop/HDFS to Dataproc.
2. O Lift and shift Hadoop/HDFS to Compute Engine.
3. O Create a single Dataproc cluster to support both analytics and data processing, and point it at a Cloud Storage bucket that contains the Parquet files that were previously stored on HDFS.
4. X Create separate Dataproc clusters to support analytics and data processing, and point both at the same Cloud Storage bucket that contains the Parquet files that were previously stored on HDFS.
>A is not correct because it is not recommended to attach persistent HDFS to Dataproc clusters in Google Cloud. (see references link)
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

You have 250,000 devices which produce a JSON device status event every 10 seconds. You want to capture this event data for outlier time series analysis. What should you do?
1. O Ship the data into BigQuery. Develop a custom application that uses the BigQuery API to query the dataset and displays device outlier data based on your business requirements.
2. O Ship the data into BigQuery. Use the BigQuery console to query the dataset and display device outlier data based on your business requirements.
3. X Ship the data into Cloud Bigtable. Use the Cloud Bigtable cbt tool to display device outlier data based on your business requirements.
4. O Ship the data into Cloud Bigtable. Install and use the HBase shell for Cloud Bigtable to query the table for device outlier data based on your business requirements.
>C is correct because the data type, volume, and query pattern best fits BigTable capabilities and also Google best practices as linked below.
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
1. Modify the monitoring agent to publish protobuf messages to Pub/Sub. Use a Dataproc cluster or Dataflow job to consume messages from Pub/Sub and write to BigTable.
2. Modify the monitoring agent to write protobuf messages directly to BigTable.
3. Modify the monitoring agent to write protobuf messages to HBase deployed on Compute Engine VM Instances
4. Modify the monitoring agent to write protobuf messages to Pub/Sub. Use a Dataproc cluster or Dataflow job to consume messages from Pub/Sub and write to Cassandra deployed on Compute Engine VM Instances.
  
You are designing storage for CSV files and using an I/O-intensive custom Apache Spark transform as part of deploying a data pipeline on Google Cloud. You intend to use ANSI SQL to run queries for your analysts. How should you transform the input data?
1. Use BigQuery for storage. Use Dataflow to run the transformations.
2. Use BigQuery for storage. Use Dataproc to run the transformations.
3. Use Cloud Storage for storage. Use Dataflow to run the transformations.
4. Use Cloud Storage for storage. Use Dataproc to run the transformations.
  
You are designing a relational data repository on Google Cloud to grow as needed. The data will be transactionally consistent and added from any location in the world. You want to monitor and adjust node count for input traffic, which can spike unpredictably. What should you do?
1. Use Cloud Spanner for storage. Monitor storage usage and increase node count if more than 70% utilized.
2. Use Cloud Spanner for storage. Monitor CPU utilization and increase node count if more than 70% utilized for your time span.
3. Use Cloud Bigtable for storage. Monitor data stored and increase node count if more than 70% utilized.
4. Use Cloud Bigtable for storage. Monitor CPU utilization and increase node count if more than 70% utilized for your time span.
  
You have a Spark application that writes data to Cloud Storage in Parquet format. You scheduled the application to run daily using DataProcSparkOperator and Apache Airflow DAG by Cloud Composer. You want to add tasks to the DAG to make the data available to BigQuery users. You want to maximize query speed and configure partitioning and clustering on the table. What should you do?
1. Use "BashOperator" to call "bq insert".
2. Use "BashOperator" to call "bq cp" with the "--append" flag.
3. Use "GoogleCloudStorageToBigQueryOperator" with "schema_object" pointing to a schema JSON in Cloud Storage and "source_format" set to "PARQUET".
4. Use "BigQueryCreateExternalTableOperator" with "schema_object" pointing to a schema JSON in Cloud Storage and "source_format" set to "PARQUET".
  
You have a website that tracks page visits for each user and then creates a Pub/Sub message with the session ID and URL of the page. You want to create a Dataflow pipeline that sums the total number of pages visited by each user and writes the result to BigQuery. User sessions timeout after 30 minutes. Which type of Dataflow window should you choose?
1. A single global window
2. Fixed-time windows with a duration of 30 minutes
3. Session-based windows with a gap duration of 30 minutes
4. Sliding-time windows with a duration of 30 minutes and a new window every 5 minute
  
You are designing a basket abandonment system for an ecommerce company. The system will send a message to a user based on these rules: a). No interaction by the user on the site for 1 hour b). Has added more than $30 worth of products to the basket c). Has not completed a transaction. You use Dataflow to process the data and decide if a message should be sent. How should you design the pipeline?
1. Use a fixed-time window with a duration of 60 minutes.
2. Use a sliding time window with a duration of 60 minutes.
3. Use a session window with a gap time duration of 60 minutes.
4. Use a global window with a time based trigger with a delay of 60 minutes.
  
You need to stream time-series data in Avro format, and then write this to both BigQuery and Cloud Bigtable simultaneously using Dataflow. You want to achieve minimal end-to-end latency. Your business requirements state this needs to be completed as quickly as possible. What should you do?
1. Create a pipeline and use ParDo transform.
2. Create a pipeline that groups the data into a PCollection and uses the Combine transform.
3. Create a pipeline that groups data using a PCollection and then uses Bigtable and BigQueryIO transforms.
4. Create a pipeline that groups data using a PCollection, and then use Avro I/O transform to write to Cloud Storage. After the data is written, load the data from Cloud Storage into BigQuery and Bigtable.
  
Your company’s on-premises Apache Hadoop servers are approaching end-of-life, and IT has decided to migrate the cluster to Dataproc. A like-for-like migration of the cluster would require 50 TB of Google Persistent Disk per node. The CIO is concerned about the cost of using that much block storage. You want to minimize the storage cost of the migration. What should you do?
1. Put the data into Cloud Storage.
2. Use preemptible virtual machines (VMs) for the Dataproc cluster.
3. Tune the Dataproc cluster so that there is just enough disk for all data.
4. Migrate some of the cold data into Cloud Storage, and keep only the hot data in Persistent Disk.
  
You are designing storage for two relational tables that are part of a 10-TB database on Google Cloud. You want to support transactions that scale horizontally. You also want to optimize data for range queries on non-key columns. What should you do?
1. Use Cloud SQL for storage. Add secondary indexes to support query patterns.
2. Use Cloud SQL for storage. Use Dataflow to transform data to support query patterns.
3. Use Cloud Spanner for storage. Add secondary indexes to support query patterns.
4. Use Cloud Spanner for storage. Use Dataflow to transform data to support query patterns.
  
Your company is streaming real-time sensor data from their factory floor into Bigtable and they have noticed extremely poor performance. How should the row key be redesigned to improve Bigtable performance on queries that populate real-time dashboards?
1. Use a row key of the form <timestamp>.
2. Use a row key of the form <sensorid>.
3. Use a row key of the form <timestamp>#<sensorid>.
4. Use a row key of the form <sensorid>#<timestamp>.
  
You are developing an application on Google Cloud that will automatically generate subject labels for users’ blog posts. You are under competitive pressure to add this feature quickly, and you have no additional developer resources. No one on your team has experience with machine learning. What should you do?
1. Call the Cloud Natural Language API from your application. Process the generated Entity Analysis as labels.
2. Call the Cloud Natural Language API from your application. Process the generated Sentiment Analysis as labels.
3. Build and train a text classification model using TensorFlow. Deploy the model using AI Platform Prediction. Call the model from your application and process the results as labels.
4. Build and train a text classification model using TensorFlow. Deploy the model using a Kubernetes Engine cluster. Call the model from your application and process the results as labels.
  
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

1. `bigquery-public-data.noaa_gsod.gsod`
2. bigquery-public-data.noaa_gsod.gsod*
3. ‘bigquery-public-data.noaa_gsod.gsod*’
4. `bigquery-public-data.noaa_gsod.gsod*`

You are working on an ML-based application that will transcribe conversations between manufacturing workers. These conversations are in English and between 30-40 sec long. Conversation recordings come from old enterprise radio sets that have a low sampling rate of 8000 Hz, but you have a large dataset of these recorded conversations with their transcriptions. You want to follow Google-recommended practices. How should you proceed with building your application?
1. Use Cloud Speech-to-Text API, and send requests in a synchronous mode.
2. Use Cloud Speech-to-Text API, and send requests in an asynchronous mode.
3. Use Cloud Speech-to-Text API, but resample your captured recordings to a rate of 16000 Hz.
4. Train your own speech recognition model because you have an uncommon use case and you have a labeled dataset.
  
You are developing an application on Google Cloud that will label famous landmarks in users’ photos. You are under competitive pressure to develop a predictive model quickly. You need to keep service costs low. What should you do?
1. Build an application that calls the Cloud Vision API. Inspect the generated MID values to supply the image labels.
2. Build an application that calls the Cloud Vision API. Pass landmark location as base64-encoded strings.
3. Build and train a classification model with TensorFlow. Deploy the model using AI Platform Prediction. Pass client image locations as base64-encoded strings.
4. Build and train a classification model with TensorFlow. Deploy the model using AI Platform Prediction. Inspect the generated MID values to supply the image labels.
  
You are building a data pipeline on Google Cloud. You need to select services that will host a deep neural network machine-learning model also hosted on Google Cloud. You also need to monitor and run jobs that could occasionally fail. What should you do?
1. Use AI Platform Prediction to host your model. Monitor the status of the Operation object for 'error' results.
2. Use AI Platform Prediction to host your model. Monitor the status of the Jobs object for 'failed' job states.
3. Use a Google Kubernetes Engine cluster to host your model. Monitor the status of the Jobs object for 'failed' job states.
4. Use a Google Kubernetes Engine cluster to host your model. Monitor the status of Operation object for 'error' results.
  
You work on a regression problem in a natural language processing domain, and you have 100M labeled examples in your dataset. You have randomly shuffled your data and split your dataset into training and test samples (in a 90/10 ratio). After you have trained the neural network and evaluated your model on a test set, you discover that the root-mean-squared error (RMSE) of your model is twice as high on the train set as on the test set. How should you improve the performance of your model?
1. Increase the share of the test sample in the train-test split.
2. Try to collect more data and increase the size of your dataset.
3. Try out regularization techniques (e.g., dropout or batch normalization) to avoid overfitting.
4. Increase the complexity of your model by, e.g., introducing an additional layer or increasing the size of vocabularies or n-grams used to avoid underfitting.
  
You are using Pub/Sub to stream inventory updates from many point-of-sale (POS) terminals into BigQuery. Each update event has the following information: product identifier "prodSku", change increment "quantityDelta", POS identification "termId", and "messageId" which is created for each push attempt from the terminal. During a network outage, you discovered that duplicated messages were sent, causing the inventory system to over-count the changes. You determine that the terminal application has design problems and may send the same event more than once during push retries. You want to ensure that the inventory update is accurate. What should you do?
1. Inspect the "publishTime" of each message. Make sure that messages whose "publishTime" values match rows in the BigQuery table are discarded.
2. Inspect the "messageId" of each message. Make sure that any messages whose "messageId" values match corresponding rows in the BigQuery table are discarded.
3. Instead of specifying a change increment for "quantityDelta", always use the derived inventory value after the increment has been applied. Name the new attribute "adjustedQuantity".
4. Add another attribute orderId to the message payload to mark the unique check-out order across all terminals. Make sure that messages whose "orderId" and "prodSku" values match corresponding rows in the BigQuery table are discarded.
  
You designed a database for patient records as a pilot project to cover a few hundred patients in three clinics. Your design used a single database table to represent all patients and their visits, and you used self-joins to generate reports. The server resource utilization was at 50%. Since then, the scope of the project has expanded. The database table must now store 100 times more patient records. You can no longer run the reports, because they either take too long or they encounter errors with insufficient compute resources. How should you adjust the database design?
1. Add capacity (memory and disk space) to the database server by the order of 200.
2. Shard the tables into smaller ones based on date ranges, and only generate reports with pre-specified date ranges.
3. Normalize the master patient-record table into the patients table and the visits table, and create other necessary tables to avoid self-join.
4. Partition the table into smaller tables, with one for each clinic. Run queries against the smaller table pairs, and use unions for consolidated reports.
  
Your startup has never implemented a formal security policy. Currently, everyone in the company has access to the datasets stored in BigQuery. Teams have the freedom to use the service as they see fit, and they have not documented their use cases. You have been asked to secure the data warehouse. You need to discover what everyone is doing. What should you do first?
1. Use Cloud Audit Logs to review data access.
2. Get the identity and access management (IAM) policy of each table.
3. Use Cloud Monitoring to see the usage of BigQuery query slots.
4. Use the Cloud Billing API to see what account the warehouse is being billed to.
  
You created a job which runs daily to import highly sensitive data from an on-premises location to Cloud Storage. You also set up a streaming data insert into Cloud Storage via a Kafka node that is running on a Compute Engine instance. You need to encrypt the data at rest and supply your own encryption key. Your key should not be stored in the Google Cloud. What should you do?
1. Create a dedicated service account, and use encryption at rest to reference your data stored in Cloud Storage and Compute Engine data as part of your API service calls.
2. Upload your own encryption key to Cloud Key Management Service, and use it to encrypt your data in Cloud Storage. Use your uploaded encryption key and reference it as part of your API service calls to encrypt your data in the Kafka node hosted on Compute Engine.
3. Upload your own encryption key to Cloud Key Management Service, and use it to encrypt your data in your Kafka node hosted on Compute Engine.
4. Supply your own encryption key, and reference it as part of your API service calls to encrypt your data in Cloud Storage and your Kafka node hosted on Compute Engine.
  
You are working on a project with two compliance requirements. The first requirement states that your developers should be able to see the Google Cloud billing charges for only their own projects. The second requirement states that your finance team members can set budgets and view the current charges for all projects in the organization. The finance team should not be able to view the project contents. You want to set permissions. What should you do?
1. Add the finance team members to the default IAM Owner role. Add the developers to a custom role that allows them to see their own spend only.
2. Add the finance team members to the Billing Administrator role for each of the billing accounts that they need to manage. Add the developers to the Viewer role for the Project.
3. Add the developers and finance managers to the Viewer role for the Project.
4. Add the finance team to the Viewer role for the Project. Add the developers to the Security Reviewer role for each of the billing accounts.
