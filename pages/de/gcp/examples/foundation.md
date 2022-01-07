# Foundation

## Setup

    # gcloud auth list
    # gcloud config list project
    
# Run Dataflow Job
    
## Create BigQuery Dataset

gcp > BigQuery > Prject > Create Dataset > lab_757

## Create Cloud Storage Bucket

gcp > Cloud Storage > Create Bucket > e73bfb79-cb0b-4603-99cd-ac38a9c7d83c

## Dataflow

gcp > DataFlowm > Create Job from Template > transfer_text_lab > Text Files on Cloud Storage to BigQuery

|Field|Value|
|-|-|
|JavaScript UDF path in Cloud Storage|gs://cloud-training/gsp323/lab.js|
|JSON path|gs://cloud-training/gsp323/lab.schema|
|JavaScript UDF name|transform|
|BigQuery output table|qwiklabs-gcp-00-a279be6951dd:lab_757.customers_967|
|Cloud Storage input path|gs://cloud-training/gsp323/lab.csv|
|Temporary BigQuery directory|gs://df0b9bd8-69cb-4bee-a846-92e744ca1ad5/bigquery_temp|
|Temporary location|gs://df0b9bd8-69cb-4bee-a846-92e744ca1ad5/temp|

![DataFlow](../../../img/gcp_lab1_1.png)

# Run Dataproc Job

gcp > Dataproc > Create Cluster

gcp > Compute Engine > ssh

    $ hdfs dfs -cp gs://cloud-training/gsp323/data.txt /data.txt
    $ hdfs dfs -ls /
    
gcp > Dataproc > Cluster > Submit Job


|Field|Value|
|-|-|
|Region|us-west1|
|Job type|Spark|
|Main class or jar|org.apache.spark.examples.SparkPageRank|
|Jar files|file:///usr/lib/spark/examples/jars/spark-examples.jar|
|Arguments|/data.txt|
|Max restarts per hour|1|

![DataFlow](../../../img/gcp_lab1_2.png)

# Run Dataprep Job

## Copy File to Cloud Storage

    $ gsutil cp gs://cloud-training/gsp323/runs.csv gs://e73bfb79-cb0b-4603-99cd-ac38a9c7d83c

## Create New Flow

gcp > Dataprep  
Cloud Storage > Create Blank Flow

## Add Receipe

Add Receipe > New Step

* Rename Columns
* Filter 'state' that ist not 'FAILURE'
* Filter 'score' greater than 0

run

# AI

## Speech API

### Create API Key

gcp > APIs & Services > Credentials > Create Credentials > API Key > AIzaSyBLpGXlk9G645QnPSkT7EkKppHBa8QmqPc
gcp > Compute Engine > ssh

    $ export API_KEY=AIzaSyBLpGXlk9G645QnPSkT7EkKppHBa8QmqPc
    
### Create Request
    
    $ cat > request.json <<EOF
    {
      "config": {
          "encoding":"FLAC",
          "languageCode": "en-US"
      },
      "audio": {
          "uri":"gs://cloud-training/gsp323/task4.flac"
      }
    }
    EOF
    
    $ curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json "https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" > task4-gcs-777.result

### Save Result in Cloud Storage

Add User to Owner Group qwiklabs-gcp-04-d3167d22221a-marking

Copy csv to cloud storage

    $ gsutil cp task4-gcs-777.result gs://qwiklabs-gcp-04-d3167d22221a-marking/

