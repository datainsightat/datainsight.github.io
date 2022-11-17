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
