# BigQuery

* Serverless
* Flexible Pricing
* Data encryption
* Geospacial data
* Foundation for BI and AI
<a/>

![Big Query](../../img/gcp_bigquery_architecture.png)

Computation time of 50 minutes down to 13 seconds!

Big Query combines data storage and the SQL engine.
  
![Big Query Components](../../img/gcp_bigquery_1.png)
  
You can load data direct into the SQL engine without uploading it into die Bigquery datastorage. 
  
## Dataprep
  
UI to explore dataset.
  
![Big Query Components](../../img/gcp_bigquery_2.png)
  
## Security
  
Viewer, Editor, Owner

## STRUCTs and ARRAYs

Structs are nested collections of columns. Arrays allow to split data cells in multiple records.

![Big Query Components](../../img/gcp_bigquery_3.png)
  
## GIS
  
GeoVIS

![Big Query Components](../../img/gcp_bigquery_4.png)
 
## Datasets
  
[Datasets](https://console.cloud.google.com/marketplace/browse?filter=solution-type:dataset)

## Machine Learning
           
ML features BigQuery:
* Write ML models in SQL
* Experiment and iterate right where your data lives
* Build classification and forecasting models
* Inspect model weights and adjust hyper parameters
           
Distribution of ML models

![Distribution ML Models](../../img/gcp_bigquery_5.png)

Types of ML models

![Types ML Models](../../img/gcp_bigquery_6.png)

### ML in BigQuery
           
ML Process in BigQuery:
* Dataset
* Create/Train
* Evaluate
* Predict/Classify

![Types ML Models](../../img/gcp_bigquery_9.png)
           
* Use Cluster to build Model
* Auto tune learning rate (alternatively set it maunually)
* Auto split training test (Random, Sequential, Custom)
* L1/L2 regularization

### ML.WEIGHTS

Show how usefull an item is to predict value.
           
### Overview
           
![Types ML Models](../../img/gcp_bigquery_10.png)

## Partitioning and Clustering

![Overview](../../img/gcp_bigquery_18.png)

### Partitioning

![Partitioning](../../img/gcp_bigquery_11.png)  

![Partitioning Time](../../img/gcp_bigquery_12.png)  

![Create Partitioning Time](../../img/gcp_bigquery_13.png)  

![Partition Filter](../../img/gcp_bigquery_14.png)

### Clustering

![Cluster](../../img/gcp_bigquery_15.png)  

![Create Cluster](../../img/gcp_bigquery_16.png)  

![Automatic Reclustering](../../img/gcp_bigquery_17.png)
