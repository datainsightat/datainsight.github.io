You are working on optimizing BigQuery for a query that is run repeatedly on a single table. Teh data queries is about 1GB., and some rows are expected to change about 10 times every hour. You have optimized the SQL statements as mmuch as possible. You want to further optimize the query's performance. What should you do?

* Create a materialized view based on the table, and quer that view.

> A is correct because materialized view periodically cache the results of a query for inreeased performance. Materialized views are suiteed to small datasets that are frequently queried. Wehen underlying table data changes, the materialized view invalidates the affected portions and re-reads them.

<hr>

Several year ago, you built a machine learning model for an ecommerce company. Your model made good predictions. Then a global pandemic occurred, lockdowns were imposed, and many people started working from home. Now the quality of your model has degraded. You want to improve the quality of your model and prevent future performance degradation. What should you do?

* Retrain the model with data from the last 30 days. Add a step to continuously monitor model input data for changes, and retrain the model

> Option D is correct becase the data used to build the original model is no longer relevant. Retraining the model with recent data from the last 30 days will improve the predictions. To keep a watch on future data drifts, monitor the incoming data.

<hr>

A new member of your development team works remotely. The developer will write code locally on their laptop, which will connect to a MySQL instance on Cloud SQL. The instance has an external (public) IP address. You want to follow Google-recommended practices when you give access to Cloud SQL to the new team meber. What should you do?

* Give instance access percmission in Identity and Access Management (IAM), and have the developer run Cloud SQL Auth proxy to connect to a MySQL instance.

> C is correct because the recommended approach is to use Cloud SQL Auth proxy. Permissions can be controlled by IAM. You don't need to track authorization lists for changing user IP addresses.

<hr>

Your Cloud Spanner database stores customerr address information that is frequently accessed by the marketing team. When a customer neters the country and the state where they live, this information is stored in different tables connected by a foreign key. The current architecture has performance issues. You want to foloow Google-recommended practices to improve performance. What should you do?

* Create interleaved tables, and store states under the countrires.

> A is correct because Cloud Spanner supports interleaving that guarantees data being stored in the same split, which is performant when you need a strong data locality relationsship.

<hr>

Your Bigtable database was revently deployed into production. The scale of data ingested and anaylzed has incresed significantly, bzt the performance has degraded. You want to identify the performance issue. What should you do?

* Use Key Visualizer to analyze performance.

> A is correcct because Key Visualizer for Bigtable generates visual reports for your tables that detail you usage based on the row keys that you access, show you how Bigtable operats and can help you troubleshoot performance issues.

<hr>

Your company is moving your data analytics to BigQuery. Your other operations will mreina on-premises. You need to transfer 800 TB of historics data. You also need to plan for 30 Gbps of daily data transfers that must be appended for analysis the next day. You want to follow Google-recommended practices to transfer your date. What should you do?

* Use a Transfer Appliance to move the existing data to Google Cloud. Set up a Dedicated of Partner Interconnect for daily transfers.

> D is correct because using a Transfer Applicance is recommended to transfer hunrets of tereabytes of data. For large data transfers that occur regularly, a dedicated, hybrid networking connection is recommended.

<hr>

Your customer has a SQL Sever database that contains about 5 TB of data in another public cloud. You expect the data to grow to a maximum of 25 TB. The database is the backend of an internal reporting application that is used once a week. You want to migrate the application to Google Cloud to reduce administrative effort while keeping costs the same or reducing them. What should you do?

* Migrate the database to SQL Server in Cloud SQL

> D is correct because Cloud SQL provides managed MySQL, PostgreSQL, ans SQL Server databases, which will reduce administrative effort. Twenty-five TB can be accomodated efficiently on Cloud SQL.

<hr>

Your IT tean uses BigQuery for storing structured data. Your finance team recently moved to Google Workspace Enterprise edition from a standalone, desktop-based spreadsheet processor. When the finance team needs data insights, the IT team runs a query on BigQuery, expors the data to a CSV file, and sends the file as an email attachment to the finance team members. You want to improve the process while you retain familiar methods of data analysis for the finance team. What should you do?

* Run the query in BigQuery, and save the results to a Google Sheets shared spreadsheet that can be acecssed and analyzed by the finance team.

> D is correct becuase Connected Sheets gives you a direct and easy way to share BigQuery data through Google Sheets.

<hr>

Your cryptocurrency trading company visualizes prizes to help your customers make trading decisions. Because different trades happen in real time, the price data is fed to a data pipeline that uses Dataflow for processing. You want to compute moving averages. What should you do?

* Use a hopping window in Dataflow

> A is correct because you use a hopping window to compute moving averages.

<hr>

You are building the trading platform for a stock exchange with millions of traders. Trading data is written rapidly. You need to retrieve data quickly to show visulizations to the traders, such as the changing price of a particular stock over time. You need to choose a storage solution in Google Cloud. What should you do?

* Use Bigtable

> A is correct because Bigtable is the recommended database for time series data that requires high throughput reads and writes.

<hr>

You are on a team of analysts who work with BigQuery and are already proficient in SQL. Your team needs to build a multi-label machine learning classification model that uses data in BigQuery. There are 6000 rows of data in your training dataset. The inferences could be on of 200 possible labels. You want to create a high accuracy model. What should you do?

* Connect the data from BigQurty to AutoML, and build the model in AutoML

> C is correct because the amount of data is relatively low and also varied. A model built using only this data wouldn't be accurate. AutoML is appropriate because it uses transfer learning based on other similar data.

<hr>

You used a small amount of data to build a machine learning model that gives you good inferences during testing. However, the results show more errors when real-world data is used to run the model. No additional data can be collected for testing. You want to get a more accurate view of the model's capability. What should you do?

* Cross-validate the data, an re-run the model building process

> B is correct because this model appears to be overfitting. Using cross-validation will run the validation on multiple folds of the data, which reduces the overfitting.

<hr>

#8 You are building new real-time data warehouse for your company and will use Google BigQuery streaming inserts. There is no guarantee that data will only be sent in once but you do have a unique ID for each row of data and an event timestamp. You want to ensure that duplicates are not included while interactively quering data. Which query type should you use?

> Use the ROW_NUMBER window function with PARTITION by unique ID along with WHERE row equals 1.

<hr>

#10 Your company is in a highly regulated industry. One of your requirements is to ensure individual users have access only to the minimum amount of information required to do their jobs. You want to enforce this requirement with Google BigQuery. Which three approaches can you take?

> Restrict access to tables by role
> Restrict BigQuery API access to approved users
> Use Google Stackdriver Audit Logging to determine policy violations

#11 You are designing a basket abandoment system for an ecommerce company. The system will send a message to a user based on these rules: No interaction by the user on the site for 1 hour. Has added more than $30 worth of products to the basket. Has not completed a transaction. You use Google Cloud Dataflow to process the data and decide if a message should be sent. How should you design the pipeline?

> Use a session window with a gap time duration of 60 minutes

<hr>

#12 You company handles data processing for a number of different clinets. Each clinent prefers to use their own suite of analytics tools, with some allowing direct query access via Google BigQuery. You need to secure the data so that clients cannot see each other's data. You want to ensure appropriate access to the data. Which steps should you take?

> Load data into different dataset for each client
> Restrict a client's dataset to approved users
> Use the appropriate identity and access management (IAM) roles for each client's users

#13 You want to process payment transactions in a point-of-sale application that will run on Google Cloud Platform. You user base could grow expnentially, but you do not want to manage infrastructrure scaling. Which Google database sevice should you use.

> Cloud Datastore

<hr>

#14 You wna to use a database of tissue samles to classify future tissue samples as either normal or mutated. You are evaluating an unsupervised anomaly detection method for classifying the tissue samples. Which two characterisics support this mehod?

> ? There are very few occurances of mutation relative to normal samples.
? There are roughly equal occurrences of both normal and mutated samples in the database.
> ? You expect future mutations to have different features from the mutated samples in the database
? You expect future mutations to have similar features to the mutated samples in the database.
? You already have labels for which samples are mutated and which are normal in the database

<hr>

#15 You need to store social media postings in Google Big Query at a rate of 10000 messages per minute in near real-time. Initially, design the application to use streaming inserts for individual postings. You application also performs data aggregations right after the streaming inserts. You discover that the queries after streaming inserts fo not eshibit strong consistency, and reports from the queries might miss in-flight data. How can you adjust your application design ?

? Re-write the application to load accumulated data every 2 minutes.
? Convert the streaming insert code to batch load for individual messages.
? Load the original message to Google Cloud SQL, and export the table every hour to BigQuery via steramin inserts.
> ? Estimate the average latency for data availability after streaming inserts, and always run queries after waiting twice as long.

<hr>

#18 Business owneers at your company have given you a database of bank transactions. Each row contains the user ID, transaction type, transaction location, and transaction amount. They ask you to investigate what type of machine learning can be appilced to the data. Which threee machine learning applications can you use?


? Supervised learning to determine which transactions are most likely to be fraudulent.
> ? Unsupervised learning to determine which transactions are most likely to be fraudulent.
> ? Clustering to divide the transactions into N categories based on feature similarity.
> ? Supervised learning to predict the location of a transaction
? Reinforcement learnign to predict the location of a transaction
? Unsupervised learning to predict the location of a transaction.

<hr>

#19 Your company's on-premises Apache Hadoop servers are approaching end-of-life, and IT has decided to migrate the cluster to Google Cloud Dataproc. A like-for-like migration of the cluste rwould require 50 TB of Google Persistent Disk per node. The CIO is concerned about the cost of using that much block storage. You want to minimize the storage cost of the migration. What should you do?

> ! Put the data into Google Cloud Storage.
! Use preemptible virtual machines (VMs) for the Cloud Dataproc cluster.
! Tune the Cloud Dataproc cluster so that there is just enough disk for all data.
! Migrate some of the cold data into Google Cloud Storage, and keep only the hot data in Persistent Disk.

<hr>

#28 Your compoany is performaing data processing for a learning algorithm in Google Cloud Dataflow. Numerous data logs are being generated during this step, and the team wants to analyze them. Due to the dynamic nature of the campaig, the data is growing exponentially every hour. The data scientists have wrtitten the following code to read the data for a new key features in the logs.

BigQueryIO.Read.names("ReadLogData").from("Clouddataflow-readonly::samples.log_data")

You want to improve the performance of this data read. What should you do?

? Use .fromQuery operation to read specific fields from the table.
> ? Call a transform that returns TableRow objects, where each element in the PCollection represents a single row in the table.

<hr>

#32 Your company is running their first dynamic campaign, serving different offers by analyzing real-time data during the holiday season. The data scientists are collecting terabytes of data that rapidly grows every hour during the 30-day campaign. They are using Google Cloud dataflow to preprocess the data and collecct the features (signals) data that is needed for the machine learning model in Google Cloud Bigtable. The team is observing suboptimal performance with reads and writes of their initial load of 10TB of data. They want to imorove this performance while mainimizing cost. What should they do?.

* Redefine the schema by evenly distributing reads and writes across the row space of the table.

<hr>

#33 Your software uses a simple JSON format for all messages. These messags are published to Google Cloud Pub/Sub, the processed with Google Cloud Dataflow to create a real-time dashboard for the CFO. Durign testing, you notice that some messages are missing in the dashobaord. You check the logs, and all messages are being published to Cloud Pub/Sub successfully. What shoudl you do next?

* Use Google Stackdriver Monitoring on Cloud Pub/Sub to find the missing messages.

<hr>

#46 You work for an economic consulting firm that helps companies identify economic trends as they happen. As part of your analysis, you use Google BigQuery to correlate customer data with the average prices of the 100 most common goods sold, including bread, gasoline, milk and others. The average prices of these goods are updated every 30 minuts. You want to make sure this data stays op to date so you can combine it with other data in BigQuery as cheaply as possible. What should you do?

* Store and update the data in a regional Google Cloud Storage bucket and crate a federated data source in BigQuery

<hr>

#47 You are designing the database schema for a machine learning based food ordering service that will predict what userrs want to eat. Here is some of the information you need to store:
- The user profile: What the user likes and doesn't like to eat
- The user acount information: Name, adress, preferred meal times
- The order information: When orders are made, from where, to whom
- The database  will be used to store all transactional data of the product. You want to optimize the data schema. Which Goodle Cloud Platform product should you use?

* Cloud Datastore

<hr>

#50 You are choosing ad NoSQL database to handle telemetry data submitted from millions of internet-of-Things (IoT) devices. The volume of data is growing at 100 TB per year, and each jdata entry has about 100 attributes. The data processing pipeline does not require atomicitiy, consistency, isolation, and durability (ACID). However, high availability and low latency are required.
You need to analyze the data ny querying against individual fields. Which threee databases meet your requirements?

* HBase
* MongoDB
* Cassandra

<hr>

#51 You are training a spam classifier. You notice that you are overfitting the training data. Which threee actions can you take to resolve this pronlem?

* Get more training examples
* Use a smaller set of features
* Increase the regulariuation parameters

<hr>

Your globally distributed auction application allows users to bid om items. Occasionally, users place identical bids at klnearly identical times, and different application servers process those bids. Each bid event contains the item, amount, user, and timesttamp. You want to collate those bid events into a single location in real time to determine whichuser bid first. What should you do?

* Have each application server write the bid events to Cloud Pub/Sub as they occur. Push the events from Cloud Pub/Sub to a custom endpoint that wirte the nid event information into Cloud SQL.

<hr>

Your organization has been collecting and analyzing data in Google BigQuery for 6 months. The majority of the data analyzed is placed in a time-partitioned table named events_partitioned. To reduce the cost of queries, your organization created a view calles events, which requires only the last 14 days of data. The view is described in legacy SQL. Next month, existing applications will be connecting to BigQuery to read the events data via an ODBC connection. You need to ensure the applications can connecct. Which two actions should you take?

* Create a new view over events_partitioned using standard SQL
* Create a service account for the ODBC connection to use for authentication.

<hr>

#57 Your company is curreently setting up data pipelines for their campaign. For all the Goodle Cloud Pub/Sub streaming data, one of the important business requirements is to be able to peridodically identify the inputs and their timings during their campaign. Engineers have decided to use windowing and transformation in Google Cloud Dataflow for this purpose. However, when testing this feature, they find that the Cloud Dataflow job fails for all the streaming insert. What is the most likely cause of this problem?

* They have not applied a non-global windowing function, which causes the job to fail when the pipeline is created.

<hr>

#59 An online retailer has built their current application on Google App Engine. A new initiative at the company mandates that they extend their application to allow their customers to transact directly via the application. They need to manage their shopping transactions and analyze combined data from multiple datasetts using a business intelligence tool. They want to use only a single database for this purpose. Whih google Cloud dtabase should they choose?

* Cloud SQL

<hr>

#60 You launched a new gaming app almost three years ago. You have been uplloading log files ffrom the previous day to a sparate Google Big Query Tanle with the table name format LOGS_yyyymmdd. You have beem using tanle wildcard functions to generate daily and monthly reports for all time ranges. Recently, you discovered that some queries that cover longs date ranges are exceeding the liit of 1000 tables and failing. How can you resolve this issue?

* Convert the sharded tanles into a single partinioned table

<hr>

#66 You set up a streaming data insert into a Redis cluster via a Kafka cluster. Both clusters are running on Compute Engine instances. You need to encrypt data at rest with encryption keys that you can create, rotate, and destroy as needed. What should your do?

* Create encryption keys in Cloud Key Management Service. Use those keys to encrypt your data in all of the Compute Engine cluster instances.

<hr>

Your infrastructure includes a set of YouTune channels. You have neem taked with creating a process for sending the YouTube channel data to Google Cloud for analysis. You want to design a solution that allows your world-wide marketing teams to perform ANSI SQL and other types of analyis on up-to-date YouTune channel log data. How should you set up the log data transfer into Google Cloud?

* Use Storage Transfer Service to transfer the offsite backup files to a Cloud Storage Mulit-Regional storage bucket as a final destination.

<hr>

#72 You are designing storage for 20 TB of text files as part of deploying a data pipeline on Google Cloud. yoie input data is in CSV format. You want to minimize the cost of querying aggregate values for multiple users who will query the data in Cloud Storage with multiple engines. Which storage service and schema design should you use?

* Use Cloud Storage for storage. Link as permanent tables in BigQuery for query.

<hr>

#74 Your financial services company is movint to cloud technology and wants to store 50 TB of financial time-series data in the cloud. This data is updated frequently and new data will be streaming in all the time. Your company also wants to move their existins Apache Hadoop jobs to the cloud to get insights into this data. which product should they use to store the data?

* Cloud Bigtable

<hr>

An organization maintains a Google BigQuery dataset that contains tables with user-level data. They want to expose aggregates of this data to other Google Cloud projects, while still controlling access to the user-level data. Additionally, they need to minimize their overall storage cost and ensure the analysis cost for other projects is assigned to those projects. What should they do?

* Create and share a new dataset and view that provides the aggregate results

<hr>

#78 You are responsible for writing your companies ETL pipelines to run on an Apache Hadoop clusterr. The pipeline will require some checkpointing and splitting pipelines. Which method should you use to write the pipelines?

* PigLatin using Pig

<hr>

#80 MJTelco is building a custom interface to share data. They have these requirements: 1. They need to do aggregations over theis petabyte-scale datasets. 2. They need to scan specific time range rows with a very fast reponse time (milliseconds). Which combination of Google Cloud Platform products should you recommend?

* BigQuery and Cloud Bigtable

<hr>

#84 After migrating ETL jobs to run on BigQuery, you need to verfy that the output of the migrated hobs is the same as the output of the original. You've loaded a tanle containing the output of the original job and want to compare the contents from the migrated job to show that they are identical . The tables do not contain a primary key column that would enable you to join them together for comparison. What should you do?

* Use a Datapproc cluster and the BigQuery Hadoop connector to read the data from each table and calculate a hash from non-timestamp columns of the table after sorting. Compare the hasehes of each table.

<hr>

You are the head of BI at a large enterprise company with multiple business units that each have different priorities and budgets. You use on-demand pricing for BigQuery with a quota of 2K concurrent on-demand slots per project. Users at your organization sometimes don't get slots to execute their query and you need to correct this. You'd like to avoid introducting new projects to your account.

* Switch to flat-rate pricing and establish a hierarchical priority model for your projects

<hr>

#86 You have an Apache Kafka cluster on-prem with topics containing web application logs. You need to replicate the data to Google Cloud for analysis in Big Query and Cloud Storage. The preferred replication method is mirroring to avoid developmentt of Kafka Connect plugins.

* Deploy a Kafka cluster on GCE VM instances. Configure your on-prem cluster to mirror your topics to the cluster running in GCE. Use a Dataproc cluster or Dataflow job to read from Kafka and write to GCS.

<hr>

#87 You've migrated a Hadoop job from an on-prem cluster to dataproc and GCS. Your Spark job is a complicated analytical workload that consists of many shuffling operations and initial data are parquet files (on average 200-400 MB size each). You see some degradation in performance after the migration to Dataproc, so you'd like to optimize for it. You need to keep in mind that your organization is very cost-sensitive, so you'd like to continue using Dataproc on preemptibles (with 2 non-preemptible worker only) for this workload.

* Increase the size of your parquet files to ensure them to be 1 GB minimum.

<hr>

#88 Your team is responsible for developing and maintaining ETLs in your company. One of your Dataflow jobs is failing because of some errors in the input data, and you need to improve realianility of the pipeline (incl. being able to reprocess all failing data).

* Add a try-catch block to your DoFn that transforms the data, write erroneous rows to Pub/Sub directly from th DoFn.

<hr>

#89 Your're training a model to predict housing prices based on an available dataset with real estate properties. Your plan is to train a fully conneccted neural net, and you've discovered that the dataset contains latitude and longitude of the property. Real estate professionals have told you that the location of the property is highly influential on price, so you'd like to engineer a feature that incorporates this physical dependency. what should you do?

* Create a feature cross af latitude and longitude, bucketizeis at the minute level and use L1 regularization during optimization.

<hr>
  
#93 You're using Bigtanel for a real-time application, and you have a heavy load that is a mix of red and writes. You've recently identified an additional use case and need to perform hourly an analytical job to calculate certain statistics across the whole database. You need to ensure both the reliability of your production application as well as the analytical workload. What should you do?
  
* Add a second cluster to an existing instance with a single-cluster routing, use live-traffic app profile for your regular workload and batch-analytics profile for the analytics workload.
  
<hr>
  
#95 You have a data pipeline that writes data to Cloud Bigtable using well-designed row keys. You want to monitor your pipeline to determine when to increase the size of your cloud Bigtable cluster. Which two actions can you take to accomplish this?
  
* Monitor the latency of write operations. Increase the size of the Cloud Bigtable cluster when there is a sistained increase in write latency.
* Monitor storage utilization. Increase the size of the Cloud Bigtable cluster when utilization increases above 70% of max capacity.
  
<hr>
  
#98 Your company needs to upload their historic data to Cloud Storage. The securit rules don't allow access from external IPs to their on-premises resources. After an initial upload, they will add new data from existing on-premise applications every day. What should they do?
  
 * Execute gsutil rsync from the on-premises servers.
  
<hr>
  
#101 You need to copy millions of sensitive patient records from a relational database to BigQuery. The total size of the database is 10TB. You need to design a solution that is secure and time-efficient. What should you do?
  
* Export the records from the database as an Avro file. Copy the file onto a Transfer Appliance and send it to Google, and then load the Avro file into BigQury using the BigQuery wen UI in the GCP Console.
  
<hr>
  
#102 You needto create a near real-time inventory dashboard that reads the main inventory tables in your BigQuery data warehouse. Historical inventory data is stored as inventory balances by item and location. You have several thousand updates to inentory every hour. You want to maximize performance of the dashboard and ensure that the data is accurate. What should you do?
  
* Use the BigQuery streaming the stream changes into a daily inventory movement table. Calculate balances in a view that joints it to the historical inventory balance table. Update the inventory balance table nightly.
  
<hr>
  
#104 You used Dataprep to create a recipe on a sample of data in a BigQuery table. You want to reuse this recipie on a daily upload of data with the same schema, after the load job with variable execution time completes. What should you do?
  
* Export the recipe as a Dataprep template, and create a job in Cloud Scheduler
  
<hr>
  
#109 You have Cloud Functions written in Node.js that pull messages from Cloud Pub/Sub and send the data to Bigquery. You observe that the message proessing rate on the Pub/Sub topic is orders of magnitude higher than anticipated, but there is no error logged in Cloud Logging. What are the two most likely causes of this problem?
  
* Error handling in the subscriber code is not handling run-time errors properly.
* The subscriber code does not acknowledge the messages that it pulls.
  
<hr>
  
#110 You are creating a new pipeline in Google Cloud to stream IoT data from Cloud Pub/Sub through Cloud Dataflor to BigQuery. While previewing the data, you notice that roughly 2% of the data appears to be corrupt. You need to modify the Cloud Dataflow pipeline to filter out this corrupt data. What should you do?
  
* Add a ParDo transform in Cloud Dataflow to discard corrupt elements.
  
<hr>
 
#113 You are a retail that wants to integrate your online sales capabilities with different in-home assistants, such as Google Home. You need to interpret customer voice commands and issue an order to the backend systems. Which solution should you choose?
  
* Dialogflow Enterprise Edition
  
<hr>
  
#115 You use a dataet in BigQuery for analysis. You want to provide third-party companies with accesss to the same dataest. You need to keep  the costs of data sharing low and ensure that thedata is current. Which solution should you choose?
  
* Use Analytics Hub to control data access, and provide third party companies with access to the dataset
  
<hr>
  
#116 Your company is in the process of migrating its on-premis data warehousing solutions to BigQuery. The exisitng  data warehouse uses trigger-based change data capture (CDC) to apply updates from multiple transactional datanase sources on a daily basis. With BigQuery, your company hopes to improve its handling of CDC so that changes to the source systems are available to query in BigQuery in near-real time using log-nased CDC streams, wjile also optimizing for the performane of applying changes to the data warehouse. Which two steps should they take to ensure that changes are available in the Big Query reporting table with minimal latency while reducing compute overhead?
  
* Insert each new CDC record and corresponding operation type to a staging table in real time.
* Periodically use a DML MERGE to perform several DML INESRT, UPDATE, and DELETTE operations at the same time on the reporting table.
                                                              
