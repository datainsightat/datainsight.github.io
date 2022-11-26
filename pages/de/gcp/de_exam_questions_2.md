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

#4 You create an important report for your large team in Google Data Studio 360. The report uses BigQuery as its data source. You notice that visualizations are not showing data that is less than 1 hour old. What should you do?

* Disable caching by editing the report settings.

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

##13 You want to process payment transactions in a point-of-sale application that will run on Google Cloud Platform. You user base could grow expnentially, but you do not want to manage infrastructrure scaling. Which Google database sevice should you use.

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


* Unsupervised learning to determine which transactions are most likely to be fraudulent.
* Clustering to divide the transactions into N categories based on feature similarity.
* Supervised learning to predict the location of a transaction

<hr>

#19 Your company's on-premises Apache Hadoop servers are approaching end-of-life, and IT has decided to migrate the cluster to Google Cloud Dataproc. A like-for-like migration of the cluste rwould require 50 TB of Google Persistent Disk per node. The CIO is concerned about the cost of using that much block storage. You want to minimize the storage cost of the migration. What should you do?

* Put the data into Google Cloud Storage

<hr>

#28 Your compoany is performaing data processing for a learning algorithm in Google Cloud Dataflow. Numerous data logs are being generated during this step, and the team wants to analyze them. Due to the dynamic nature of the campaig, the data is growing exponentially every hour. The data scientists have wrtitten the following code to read the data for a new key features in the logs.

BigQueryIO.Read.names("ReadLogData").from("Clouddataflow-readonly::samples.log_data")

You want to improve the performance of this data read. What should you do?

* Use .fromQuery operation to read specific fields from the table

<hr>

#32 Your company is running their first dynamic campaign, serving different offers by analyzing real-time data during the holiday season. The data scientists are collecting terabytes of data that rapidly grows every hour during the 30-day campaign. They are using Google Cloud dataflow to preprocess the data and collecct the features (signals) data that is needed for the machine learning model in Google Cloud Bigtable. The team is observing suboptimal performance with reads and writes of their initial load of 10TB of data. They want to imorove this performance while mainimizing cost. What should they do?.

* Redefine the schema by evenly distributing reads and writes across the row space of the table.

<hr>

##33 Your software uses a simple JSON format for all messages. These messags are published to Google Cloud Pub/Sub, the processed with Google Cloud Dataflow to create a real-time dashboard for the CFO. Durign testing, you notice that some messages are missing in the dashobaord. You check the logs, and all messages are being published to Cloud Pub/Sub successfully. What shoudl you do next?

* Use Google Stackdriver Monitoring on Cloud Pub/Sub to find the missing messages.

<hr>

#41 MJTelco needs you to create a schema in Google Bigtable that will allow for the historical analysis of the last 2 years of records. Each record that comes in is sent every 15 minutes, and contains a unique identifier of the device and a data record. The most common query is for all the data for a given device for a given day. Which schema should you use?

* Rowkey: date#device_id Column_data:data_point

<hr>

#44 You are deploying a new storage system for your mobile application, which is a media streaming service. You decide the best fit is Google Cloud Datastore. You have entities with multiple properties, some of which  can take on multiple values. for example, in the entity 'Movie' the property 'actors' and the property 'tags' have multiple values but the property 'date_released' does not. A typical query might would ask for all moview with actor=<actorname> ordered by date_released or all movies with tag=Comedy orderes by date_released. How should you avoid a combinatorial explosion in the number of indexes?
  
* Set the following in your entity options: exclude_from_indexes = 'date_published'

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

##54 Your globally distributed auction application allows users to bid om items. Occasionally, users place identical bids at klnearly identical times, and different application servers process those bids. Each bid event contains the item, amount, user, and timesttamp. You want to collate those bid events into a single location in real time to determine whichuser bid first. What should you do?

* Have each application server write the bid events to Cloud Pub/Sub as they occur. Push the events from Cloud Pub/Sub to a custom endpoint that wirte the nid event information into Cloud SQL.

<hr>

##55 Your organization has been collecting and analyzing data in Google BigQuery for 6 months. The majority of the data analyzed is placed in a time-partitioned table named events_partitioned. To reduce the cost of queries, your organization created a view calles events, which requires only the last 14 days of data. The view is described in legacy SQL. Next month, existing applications will be connecting to BigQuery to read the events data via an ODBC connection. You need to ensure the applications can connecct. Which two actions should you take?

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
  
##62 Your company receives both batch- and stream-based event data. You want to process the data using Google Cloud Dataflow over a predictable time period. However, you realize that in some instances data can arrive late or out of order. How should you design your Cloud Dataflow pipeline to handle data that is late or out of order?
  
* Use watermarks and timestamps to capture the lagged data.

<hr>

##66 You set up a streaming data insert into a Redis cluster via a Kafka cluster. Both clusters are running on Compute Engine instances. You need to encrypt data at rest with encryption keys that you can create, rotate, and destroy as needed. What should your do?

* Create encryption keys in Cloud Key Management Service. Use those keys to encrypt your data in all of the Compute Engine cluster instances.

<hr>

##69 Your infrastructure includes a set of YouTune channels. You have neem taked with creating a process for sending the YouTube channel data to Google Cloud for analysis. You want to design a solution that allows your world-wide marketing teams to perform ANSI SQL and other types of analyis on up-to-date YouTune channel log data. How should you set up the log data transfer into Google Cloud?

* Use Storage Transfer Service to transfer the offsite backup files to a Cloud Storage Mulit-Regional storage bucket as a final destination.

<hr>

#72 You are designing storage for 20 TB of text files as part of deploying a data pipeline on Google Cloud. yoie input data is in CSV format. You want to minimize the cost of querying aggregate values for multiple users who will query the data in Cloud Storage with multiple engines. Which storage service and schema design should you use?

* Use Cloud Storage for storage. Link as permanent tables in BigQuery for query.

<hr>

##74 Your financial services company is movint to cloud technology and wants to store 50 TB of financial time-series data in the cloud. This data is updated frequently and new data will be streaming in all the time. Your company also wants to move their existins Apache Hadoop jobs to the cloud to get insights into this data. which product should they use to store the data?

* Cloud Bigtable

<hr>

##75 An organization maintains a Google BigQuery dataset that contains tables with user-level data. They want to expose aggregates of this data to other Google Cloud projects, while still controlling access to the user-level data. Additionally, they need to minimize their overall storage cost and ensure the analysis cost for other projects is assigned to those projects. What should they do?

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

##85 You are the head of BI at a large enterprise company with multiple business units that each have different priorities and budgets. You use on-demand pricing for BigQuery with a quota of 2K concurrent on-demand slots per project. Users at your organization sometimes don't get slots to execute their query and you need to correct this. You'd like to avoid introducting new projects to your account.

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
  
##95 You have a data pipeline that writes data to Cloud Bigtable using well-designed row keys. You want to monitor your pipeline to determine when to increase the size of your cloud Bigtable cluster. Which two actions can you take to accomplish this?
  
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
  
##104 You used Dataprep to create a recipe on a sample of data in a BigQuery table. You want to reuse this recipie on a daily upload of data with the same schema, after the load job with variable execution time completes. What should you do?
  
* Export the Dataprep job as a Dataflow template, and incorporete it into a Composter job.
  
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
  
##115 You use a dataset in BigQuery for analysis. You want to provide third-party companies with accesss to the same dataest. You need to keep  the costs of data sharing low and ensure that thedata is current. Which solution should you choose?
  
* Use Analytics Hub to control data access, and provide third party companies with access to the dataset
  
<hr>
  
##116 Your company is in the process of migrating its on-premis data warehousing solutions to BigQuery. The exisitng  data warehouse uses trigger-based change data capture (CDC) to apply updates from multiple transactional datanase sources on a daily basis. With BigQuery, your company hopes to improve its handling of CDC so that changes to the source systems are available to query in BigQuery in near-real time using log-nased CDC streams, wjile also optimizing for the performane of applying changes to the data warehouse. Which two steps should they take to ensure that changes are available in the Big Query reporting table with minimal latency while reducing compute overhead?
  
* Insert each new CDC record and corresponding operation type to a staging table in real time.
* Periodically use a DML MERGE to perform several DML INESRT, UPDATE, and DELETTE operations at the same time on the reporting table.
                                                              
<hr>

#121 You currently have a single on-premises Kadka cluster in a data enter in the us-east region that is responsible for ingesting messages from IoT devices globally. Because large parts of globe have poor internet connectivity, messages sometimes batch at the edge, come in all at once, and cause a spike in load on your Kafka clusterr. This is becoming difficult to manage and prohibitevely expensive. What is the Google-recommended cloud native architecture for this scenario?

* An IoT gateway connected to Cloud Pub/Sub, with Cloud Dataflow to read and process the messages from Cloud Pub/Sub
  
<hr>
  
#122 You decided to use Cloud Datastoree to ingest vehicle telemetry data in real time. You want to build a storage system tht will account for the long-term dta growth, while keeping the costs low. You also want to create snapshots of the data periodically, so that you can make a point-in-time (PIT) recovery, or clone a copy of the data for Cloud Datastore in a different environment. You want to archive these snapshots for a long time. Which two methods can accompliash this?
  
  
* Use managed export, and store the data in a Cloud Storage bucket using Nearline or Coldline class
* Use managed export, and then import to Cloud Datastore in a separate project under a unique namespace reserved for that export.

<hr>

#123 You need to create a data pipeline that copies time-series transaction datta so that it can be queries from within BigQuery by your data science team for analysis. Every hour, thousands of transactions are updated with a new status. The size of the initial dataset is 1.5 PB, and it will grow ny 3 TB per day. The data is heavily structured, and your data science team will build machine learning models based on this data. You want to maximise performance and usability for your data sciene team. Which two strategies should you adopt?

* Denormalize the data as much as possible
* Develop a data pipeline where status updates are appended to BigQuery instead of updated.

<hr>

#125 You have a petabyte of analytics data and need to design a storage and processing platform for it. You must ne able to perrform data warehouse-style analytics on the data in google Cloud and expos the dataset as files for batch analysis tools in other cloud providers. What should you do?

* Store the full dataset in BigQuery, and store a compressed copy of the data in a Cloud Storage bucket.

<hr>

#126 You work for a manufacturing company that sources up to 750 different components, each from a different supplier. You've collected a laneled dattasett that has on average 1000 examples for each unique component. Your team wants to implement an app to help warehouse workers recognize incoming components based on a photo of the compoonent. You want to implement the first working version of the app within a few working days. What should you do?

* Use Cloud Vision AutoML, but reduce your dataset twice.

> 100 samples/class if there are just a few classes and more than 200 samples/class if your have more than 50 distinct classes.

<hr>

#127 You are working on a niche product in the image recognition domain. Your team has developed a model that is dominated by custom C++ TensorFlow ops your team has implemented. These ops are used inside our main training loop and are performing bulky matrix multiplications. It currently takes up to several days to train a model. You want to decrease this time significantly and keep the cost low by using an accelerator on Google Cloud. What should you do?

* Stay on CPUs, and increase the size of the cluser you're training your model on.

> TPU does not support custom C++ tensorflow ops.

<hr>

#128 You work on a regression problem in a natural language processing domain, and you have 100M labeled examples in your dataset. You have randomly shuffled your data and split your datasett into train and test samples. After you trained the neral network and evaluated your mmodel on a test set, you discover that the RMSE of your model is tiwce as high on the train set as on the test set. how should you improce the performance of your model?

* Increase the complexity of your model by introducing an additional layer or increase sizing the size of vocabularies or n-grams used.

<hr>

##129 You use BigQuery as your centrlized analytics platform. New data is loaded every day, and an ETL pipeline modifies the original data and prepares it for the final uses. This ETL pipeline is regularly modified and can generate errors, but sometimes the errors are detected only after 2 weeks. You need to provide a method to recover from these errors, and your backup should be optimized for storge costs. How should you organize your data in BigQuery and store your backups?

* Organize your data in separate tables for each month, and export, compress, and store the data in Cloud Storage

<hr>

##130 The marketing team at your organization provides regular updates of a segment of your customer dataset. The marketing team has given youa CSV with 1 million records that must be updated in BigQuery. When you use the UPDATE statement in BigQury, you receive a quotaExceeded error. What should you do?

* Import the new records from the CSV file intoa new BigQuery table. Create a BigQuery job that merges the new records with the existing records and writes the results to a new BigQuery table.

##131 As your organization expands its usage of GCP, many teams have started to create their own projects. Projects are further multiplied to accomodate different stages of deployments and target audiences. Each project requires unique access control configurations. The central IT team needs to have access o all projects. Furthermore, data from Cloud Storage buckets and BigQuerry datasets must be shared for use in other projects in an ad hoc way. You want to simplify access control management by minimizing the number of policies. Which two steps should you take?

* Introduce resource hierarchy to leverage access control policy inheritance.
* Create distinct groups for various temas, and specify groups in Cloud IAM policies.

<hr>

#132 Your United States-based company has created an application for assessing and responding to user actions. The primary tables's data volume grows by 250.000 records per second. Many third parties use your application's API to build the functionality into their own frontend applications. Your application's API should comply with the following requirements: single global endpoint, ANSI SQL supoort, Consistent access to the most up-to-date data. What should you do?

* Implement Cloud Spanner with the leader in North America and read-only replicas in Asia and Europa.

<hr>

#133 A data scientist has created a BigQuery  ML model and asks you to create an ML pipeline to serve predictions. You a REST API application with the requirement to serverr predicitinos for an individual user ID with latency under 100 milliseconds. You use the following query to generate predictions: SELECT predicted_label, user_id FROM ML.PREDICT (MoDEL 'dataset.model', table user_features). How should you creaate the ML pipeline?

* Create a Dataflow pipeline using BigQueryIO to read predictions for all users from the query. Write the results to Bigtable usind BigtableIO. Grant the Bigtable Reader role to the application service account so that the application can read predictions for individual users form Bigtable.

<hr>

#134 You are building an appilcation to share financial market data with consumers, who will receive data feeds.  Data is collected from the markets in real time. Consumers will receive the data in the following ways: Real-time event stream, ANSI SQL access to real-time stream and historical data, Batch historical exports. Which solution should you use?

* Cloud Pub/Sub, Cloud Storage, BigQuery

<hr>

##136 You are running a pipeline in Dataflow that receives messages from a Pub/Sub topic and writes the results to a BigQuery dataset in the EU. Currently, your Pipeline is located in europe-west4 and has a maximum of 3 workers, instance type n1-standard-1. You notice that during peak periods, you pipeline is struggling to process records in a timely fashion, when all 3 workers are a maximum CPU utilization. Which two actions can you take to increase performance of your pipeline?

* Increase the number of max workers
* Use a larger instance type of your Dataflow workers

<hr>

#137 You have a data pipeline with a Dataflow job that aggregates and writes time series metrics to Bigtable. You notice that data is slow to update in Bigtable. This data feeds a dashboard used by thousands of users across the organization. You need to support additional concurrent users and reduce the amount of time required to write the data. Which two actoins should you take?

* Increase the maximum number of Dataflow workers by setting maxNumWorkers in PipelineOptions
* Increasee the number of nodes in the Bigtable cluster

<hr>

#140 You need to create a new transaction table in Cloud Spanner that stores product sales dat. You are deciding what to use as a primary key. From a performance perspective, which strategy should you choose?

* A random universally unique identifier number (version 4 UUID)

<hr>

#141 Data Analysts in your company have the Cloud IAM Owne role assigned to them in their projects to allow them to work with multiple GCP products in their projects. Your organizatin requires that all BigQueryy data access logs ne retained for 6 months. You need to ensure that only audit personnel in your company can access the data access logs for all projects. What should you do?

* Export the data access logs via an aggregated export sink to a Cloud Storage in a newly created project for audit logs. Restrict access to the project that contains the exported logs.

<hr>

#146 You want to migrate an on-premise Hadoop system to Cloud Dataproc. Hive is the primary tool in use, and the data format is Optimized Row Columnar (ORC). All ORC files have been successfully copied to a Cloud Storage bucket. You need to replicate some data to the cluster's local Hadoop Dirstributed File System (HDFS). to maximize performance. What are two ways to start using Hive in Cloud Dataproc?

* Run the gsutil utility to transfer all ORC files from the Cloud Storage bucket to the master node of the Dataproc cluster. Then run the Hadoop utilit to copy them to HDFS. Mount the Hive tables from HDFS.
* Leverate Cloud Storage connecctor for Hadoop to mount the ORC files as external Hive tables. Replicate external Hive tables to native ones.

<hr>

##149 You are migrating your data warehousee to BigQuery. You have migrated all of your data into tables in a dataset. Mulitplie users from your organization will be using the data. They should only see certain tables based on their team membership. How should you set your permissions?
  
* Assign the users/groups data view access at the table level for each table.
  
<hr>
  
#150 You want to build a managed Hadoop system as your data lake. The data transformation process is composed of a series of Hadoop jobs executed in sequence. To accomplish the deisn of separating storage from compute, you decided to use the Cloud Storage connector to store all input data, output data, and intermediary data. However, you noticed that on Hadoop job runs very slowly with Cloud Dataproc, when compared with the on-premises bare-metal Hadoop environment (8-core nodes with 100 GB RAM). Analysis shows that this particular Hadoop job is disk I/O intensive. You want to resolve the issue. What should you do?

* Allocate sufficient persistent disk space to the Hadoop cluster, and store the intermediate data of that particular Hadoop job on native HDFS.

<hr>
  
##154 You plan to deploy Cloud SQL using MySQL. You need to ensure high availability in the event of a zone failure. What should you do?

* Create a Cloud SQL instance in one zone, and crate a failover replica in another zone within the same region.
  
<hr>

#155 Your company is selecting a system to centralize data ingestion and delivery. You are considering messaging and data integration systems to address requirements. The key requirements are: The ability to seek to a particular offsettt in a topic, piossibly back to the start of all data ever captured. Support for publish/subscribe semantics on hundreds of topics.

* Apache Kafka

<hr>

#158 You need to deploy additinal dependencies to all nodes of a Cloud Dataproc cluster at stratup using an existing initialization action. Company security policies require that Cloud Dataproc nodes do not have access to the internet so public initialization actions cannot fetch resources. What should you do?

* Copy all dependencies to a Cloud Storage bucket within your VPC security perimeter

<hr>
  
##162 You need to choose a database to store time series CPU and memory usage for millions of computers. You need to store this data in one-second interval samples. Analysts will be performing real-time, ad hoc analytics against the database. You want to avoid beeing charged for every query executed and ensure that the schema design will allow for future growth of the dataset. Which database and data model should you choose?
  
* Create a narrow table in Bigtable with a row key that combines the Compute Engine computer identifier with the sample time at each second.
  
<hr>

#162 You want to archive data in Cloud storage. Because some data is very sensitive, you want to use 'Trust No One' (TNO) approach to encrypt your data and prevent the cloud provider staff from decrypting your data. What should you do?

* Use gcloud kms keys create to create a symmettric key. Then use gcloud kms encrypt to encrypt ecah arichival file with the key and unique additional authenticated data (AAD). Use gsutil cp to upload each encrypted file to the Cloud Storage bucket, and keep the AAD outside of Google Cloud.

<hr>

#165 You work for a large bank that operates in locatoins throughout North America. You are setting up a storage system that will handle bank account transactions. You require ACID compliance and the ability to access data with SQL. Which solution is appropriate?

* Store transactions in Cloud Spanner. Use locking read-write transactions.

<hr>

#168 You work for a financial institution that lets customers register online. As new custoemrs register, their user data is sent to Pub/Sub before being ingested into BigQuery. For security reasons, you decide to redact your customers' Governemtn issued Identifiction Number while allowing customer service representatives to view the original values when necessary. What should you do?

* use BigQuery column-level security. Set the table permissions so that only members of the Customer Service user group can see the SSN column.

<hr>

#170 You are updating the ccode for a subscriber to a Pub/Sub feed. Your are concerned that upon deployment the subscriber may erroneously acknowledge messages, leading to message loss. Your subscriber is not set up to retain acknowledged messages. What should you do to ensure that you can recover from errors after deployment?

* Create a Pub/Sub snapshot before deploying new subscriber code. Use a Seek operation to re-deliver messages that became available after the snapshot was created.

<hr>

#171 You work for a large real estate firm and are preparing 6TB of home sales dat to be used for machine learning. You will use SQL to transform the data and use BigQuer ML to create a machine learning model. You plan to use the model for predictions against a raw dataset that has not been transformed. How should you set up your workflow in order to prevent skew at prediction time?

* When creating your model, usee BigQuery's TRANSFORM clause to define preprocessing steps. At prediction time, use BigQuery's ML.EVALUATE clause without specifying any transformations on the raw input data.

<hr>
  
##172 You are analyzing the price of a company's stock. Every 5 seconds, you need to compute a moving avaerage of the past 30 seconds' worth of data. You are reading data from Pub/Sub and using DataFlow to conduct the analysis. How should you set up your windowed pipelin?
  
* Use a sliding window with a duration of 30 seconds and a period of 5 seconds. Emit results by setting the following trigger: AfterWatermark.pastEndOfWindow()
  
<hr>

#173 You are designing a pipeline that publishes application events to a Pub/Sub topic. Although message ordering is not important, you need to be able to aggregate events across disjoint hourly intervals before loading the results to BigQuery for analysis. What technology should you use to process and load this data to BigQuery while ensuring that it will scale with large volumes of events?

* Create a streaming Dataflow job that reads continually from the Pub/Sub topic and performs the necessary aggregations using tumbling windows.

<hr>

##177 You want to rebuild you batch pipeline for structured data on Google Cloud. You are using Pyspark to conduct data transformations at scale, but your pipelines are taking over twelve hours to run. To expedite development and pipeline run time, you want to use a serverless tool and SQL syntax. You have already moved your raw data into Cloud Storage. How should you build the pipeline on Google Cloud while meeting speed and processing requirements?

* Ingest your data into BigQuery from Cloud Storage, convert your PySpark commands into BigQuery SQL queries to transform the data, and then write the transformations to a new table.

<hr>

#178 You are testing a Dataflow pipeline to ingest and transform text files. The files are compressed gzip, errors are written to a dear-letter queue, and you are using SideInputs to join data. You noticed that the pipeline is taking longer to complee than expected; what should you do to expedite the Dataflow job?

* Use CoGroupByKey instead of the SideInput.

<hr>

#179 You are building a real-time prediction engine that streams files, which may contain PII (personal identifiable information) data, into Cloud Storage and eventually into BigQuery. You want to ensure that the sensitive data is masked but still maintains referential integrity, because names and emails are often used as join keys. How shouldyou use the Cloud Data Loss Prevention API (DLP API) to ensure that the PII data is not accessible by unauthorized individuals?

* Create a pseudonym by replacing the PII data with cryptogenic format-preserving token.

<hr>

#181 You need to give new website users a globally unique identifier (GUID) using a service that takes in data points and returns a GUID. This data is rouced from bith internal and external systems via HTTP calls that you will make via microservices within you pipeline. There will be tens of thousands of messages per second and that can be multi-threaded. You worry about the backpressure on the system. How should you design your pipeline to minimize that backpreassure?

* Batch the job into ten-second increments.

<hr>

##184 You are building a report-only data warehouse where the data is streamed into BigQuery bia the steaming API. Following Google's best practices, you have both a staging and a production table for the data. How should you design you data loading to ensure that there is only one master dataset without affecting performance on either the ingestion or reporting pieces?

* Have a staging table that moves the staged data over the production table and delettes the contents of the staging table every three hours.

> When using streaming API, the BigQuery streaming buffer remains active for about 30 to 60 minutes, which means that you can't delete or change data during that time.

<hr>

#185 You issue a new batch job to Dataflow. The job starts successfully, processes a few elements, and then suddenly fails ans shuts down. You navigate to the Dataflow monitoring interface where you fing errors related to a particular DoFn in you pipeline. What is the most likely cause of the errors?

* Exceptions in worker code

<hr>

#186 Your new customer has requested daily reports that show their net consumption of Google Cloud compute resources and who used the resources. You need to quickly and efficiently generate these daily reports. What should you do?

* Do daily exports of Cloud Logging data to BigQuery. Create views filtering by project, log type, resource, and user.
  
##187 The Development and external teams have the project viewer identity and Access Management role in a folder named Visualization. You want the Development team to be able to read data from both Cloud Storage and BigQuery, but the External Team should only be able to read data from BigQuery. What should you do?
  
* Create a VPC Service Controls perimeter containg both projeccts and Cloud Storage as a restricted API. Add the Development Team users to the perimeters Access Level.
  
<hr>

#188 Your startup has a web application that currently serves customers out of a single region in Asia. You are targeting funding that will allow your startup to serve customers globally. Your current goal is to optimize for cost, and your post-funding goal is to optimize for global presence and performance. You must use a native JDBC driver. What should you do?

* Use Cloud Spanner to configure a single region instance initially, and then configure multi-region Cloud Spanner instances after securing fungding.

<hr>

#191 You are developing a new deep learning model that predicts a customer's likelihood to buy on your ecommerce site. After running an evaluation of the model against both the original data and new test data, you find that your model is overfitting the data. You want to improve the accuracy of the model when predicting new data. What should you do?

* Increase the size of the training dataset, and decrease the numner of input features.

<hr>

#193 An aerospace company uses a proprietary data format to store its flight data. You need to connecct this new data source to BigQuery and stream the data into BigQuery. You want to  efficiently import the data into BigQuery while consuming as few resources as possible. What should you do?


* Use an Apache Beam custom connector to write a Dataflow pipeline that streams the data into BigQuery in Acro format.

<hr>

#195 Your company wants to be able to retrieve large results of medical information from your current system, which has over 10 TBs in the database, and store the data in new tables for further query. The database must have a low-maintenance architecture and be accessible via SQL. You need to implement a cost-effective solution that can support data analytics for large reult sets. What should you do? 

* Use BigQuery as a data warehouse. Set output destinations for caching large queries.

<hr>

#196 You are designing a system that requires an ACID-compliantt database. You must ensure that the system requires minimal human intervention in case of a failure. What should you do?

* Configure a Cloud SQL for PostgreSQL isntance with high availability enabled.
  
##198 You are implementing workflow pipeline scheduling using open source-based tools and Google Kubernetes Engine (GKE). You want to use a Google managed service to simplify and automate the task. You also want to accomodate Shared VPC networking considerations. What should you do?
  
* User Cloud Conposer in a Shared VPC configuration. Place the Cloud Compose resources in the service project.
  
<hr>

#201 You need to migrate a Redis database from an on-premise data center to a Memorystore for Redis instance. You want to follow Google-recommended practices and perform the migration for minimal cost, time and effort. What should you do?

* Make a RDB backup of the Redis database, use the gsutil utility to copy the RDB file into the Cloud Storage bucket, and then import the RDB file into the Memorystore for Redis instance.

<hr>

