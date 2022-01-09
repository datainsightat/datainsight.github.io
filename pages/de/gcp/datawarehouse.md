# Datawarehouse

* Consolidate from many sources
* Data is clean, accurate and consistent
* Data should be available for querying
* Gigabytes to petabytes

## BigQuery

* Interactive SQl queries over large datasets
* Serverless
* Ecosystem of visualization and reporting tools
* Ecosystem of ETL and data processing tools
* Up-to-the minute data
* Machine Learning
* Security and collaboration
<a/>

BigQuery is fast, because it is column-orientated

![column](../../img/gcp_datawarehouse_1.png)  

![Architecture](../../img/gcp_datawarehouse_2.png)  

Data are also run length-encoded and dictionary-encoded:  

![Encoding](../../img/gcp_datawarehouse_3.png)  

Ressources are allocated as needed. A BigQuery Slot is a combination of gcp, memory and network ressources.

![Ressources](../../img/gcp_datawarehouse_4.png)  

## Security

![Structure](../../img/gcp_datawarehouse_5.png) 

![IAM](../../img/gcp_datawarehouse_6.png)  

![Security](../../img/gcp_datawarehouse_7.png)  

![Roles](../../img/gcp_datawarehouse_8.png)  

![Row Level](../../img/gcp_datawarehouse_9.png)  

![Authorized View](../../img/gcp_datawarehouse_10.png)  

![Protected Columns](../../img/gcp_datawarehouse_11.png)  

Share Datasets. Tables, Views, Materialized Views.

![Materialized Views](../../img/gcp_datawarehouse_12.png)  

![Query Lifecycle](../../img/gcp_datawarehouse_13.png)  

The cost of a query occures always at a project.

## Load Data into BigQuery

![Cloud Storage](../../img/gcp_datawarehouse_14.png)  

![BigQuery Data Transfer Service](../../img/gcp_datawarehouse_15.png)  

![BigQuery Data Transfer Service Process](../../img/gcp_datawarehouse_16.png)  

User Defined Functions (UDF) in SQL and JavaScript.

## Schemas

### Normal Form

![Normal Form](../../img/gcp_datawarehouse_17.png)  

Normalizing increases the orderlyness of the data.  

![Denormalizing](../../img/gcp_datawarehouse_18.png) 

![Joins](../../img/gcp_datawarehouse_20.png) 

### Nested and Repeated Fields

De-Normalizing increases speed. Fields with 1 to many relations decrease speed.  

![Nested Fields](../../img/gcp_datawarehouse_19.png)  

![Nested Fields](../../img/gcp_datawarehouse_21.png)    

### ARRAYS and STRUCTS

Data in Structs is pre-joined. Different levels of granularity in one dataset.   

* STRUCTS(RECORD)
* ARRAYS(REPEATED)
* ARRAYS can be part of regular fields or STRUCTS
* A single table can have many STRUCTS

![STRUCTS](../../img/gcp_datawarehouse_22.png)

![STRUCTS](../../img/gcp_datawarehouse_23.png)  

![STRUCTS](../../img/gcp_datawarehouse_24.png)  

## Optimal Schema

* Instead of joins tage advantage of nested and repeated fields in denormalized tables.
* Tables < 10 Gb = Normalized
* Tables > 10 Gb = De-Normalized
