# Foundation

## Setup

    # gcloud auth list
    # gcloud config list project
    
# Run Dataflow Job
    
## Create BigQuery Dataset

gcp > BigQuery > Project > Create Dataset > lab_760

## Create Cloud Storage Bucket

gcp > Cloud Storage > Create Bucket > 9258b099-b0d1-402a-9ffd-09d91324664f

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

    $ gsutil cp gs://cloud-training/gsp323/runs.csv gs://9258b099-b0d1-402a-9ffd-09d91324664f

## Create New Flow

gcp > Dataprep
Cloud Storage > Create Blank Flow
Import Dataset > 2068a861-c6b0-462f-814e-65041d53be84

## Add Receipe

Edit Receipe > New Step

* Rename Columns
* Filter 'state' that ist not 'FAILURE'
* Filter 'score' greater than 0

run

# AI

## Speech API

### Create API Key

gcp > APIs & Services > Credentials > Create Credentials > API Key > AIzaSyA3SpysNpuUIr2lhLSO2MBzWYmNie62g-I
gcp > Compute Engine > ssh

    $ export API_KEY=AIzaSyA3SpysNpuUIr2lhLSO2MBzWYmNie62g-I
    
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
    
    $ curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json "https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" > task4-gcs-664.result

### Save Result in Cloud Storage

Add User student-03-0472d5fcaf73@qwiklabs.net to Owner Group qwiklabs-gcp-04-d3167d22221a-marking

gcp > Cloud Storage > Manage access

Copy csv to cloud storage

    $ gsutil cp task4-gcs.result gs://qwiklabs-gcp-03-a517a1725026-marking/

## Natural Language API

## Create API Key

    $ export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value core/project)
    $ gcloud iam service-accounts create my-natlang-sa \
    --display-name "my natural language service account"
    $ gcloud iam service-accounts keys create ~/key.json \
    --iam-account my-natlang-sa@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com
    $ export GOOGLE_APPLICATION_CREDENTIALS="/home/USER/key.json"
    
## Entity Analysis Request

gcp > Compute Engine > ssh

    $ gcloud ml language analyze-entities --content="Old Norse texts portray Odin as one-eyed and long-bearded, frequently wielding a spear named Gungnir and wearing a cloak and a broad hat." > task4-gcs-492.result

    $ gsutil cp task4-cnl-801.result gs://qwiklabs-gcp-04-d3167d22221a-marking/

## Video API


