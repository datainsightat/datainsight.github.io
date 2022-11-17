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

