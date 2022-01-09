# Foundation

## Setup

    # gcloud auth list
    # gcloud config list project
    
# Run Dataflow Job
    
## Create BigQuery Dataset

gcp > BigQuery > Project > Create Dataset > lab_118

## Create Cloud Storage Bucket

gcp > Cloud Storage > Create Bucket > ee373e96-b3d6-4911-8eed-1e0fd2c85161

## Dataflow

gcp > DataFlow > Create Job from Template > transfer_text_lab > Text Files on Cloud Storage to BigQuery

|Field|Value|
|-|-|
|JavaScript UDF path in Cloud Storage|gs://cloud-training/gsp323/lab.js|
|JSON path|gs://cloud-training/gsp323/lab.schema|
|JavaScript UDF name|transform|
|BigQuery output table|qwiklabs-gcp-00-05a2418427e9:lab_118.customers_225|
|Cloud Storage input path|gs://cloud-training/gsp323/lab.csv|
|Temporary BigQuery directory|gs://ee373e96-b3d6-4911-8eed-1e0fd2c85161/bigquery_temp|
|Temporary location|gs://ee373e96-b3d6-4911-8eed-1e0fd2c85161/temp|

![DataFlow](../../../img/gcp_lab1_1.png)

# Run Dataproc Job

gcp > Dataproc > Create Cluster

gcp > Compute Engine > ssh

    $ hdfs dfs -cp gs://cloud-training/gsp323/data.txt /data.txt
    $ hdfs dfs -ls /
    
gcp > Dataproc > Cluster > Submit Job


|Field|Value|
|-|-|
|Region|us-east1|
|Job type|Spark|
|Main class or jar|org.apache.spark.examples.SparkPageRank|
|Jar files|file:///usr/lib/spark/examples/jars/spark-examples.jar|
|Arguments|/data.txt|
|Max restarts per hour|1|

![DataFlow](../../../img/gcp_lab1_2.png)

# Run Dataprep Job

## Copy File to Cloud Storage

    $ gsutil cp gs://cloud-training/gsp323/runs.csv gs://ee373e96-b3d6-4911-8eed-1e0fd2c85161

## Create New Flow

gcp > Dataprep
Cloud Storage > Create Blank Flow
Import Dataset > ee373e96-b3d6-4911-8eed-1e0fd2c85161

## Add Receipe

Edit Receipe > New Step

* Rename Columns
* Filter 'state' that ist not 'FAILURE'
* Filter 'score' greater than 0

run

# AI

## Speech API

### Create API Key

gcp > APIs & Services > Credentials > Create Credentials > API Key > AIzaSyDPnjMmgH31ThPZu8aczczdZeja_UjH_Qg
gcp > Compute Engine > ssh

    $ export API_KEY=AIzaSyDPnjMmgH31ThPZu8aczczdZeja_UjH_Qg
    
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
    
    $ curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json "https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" > task4-gcs-293.result

### Save Result in Cloud Storage

Add User student-03-0472d5fcaf73@qwiklabs.net to Owner Group qwiklabs-gcp-04-d3167d22221a-marking

gcp > Cloud Storage > Manage access

Copy csv to cloud storage

    $ gsutil cp task4-gcs-293.result gs://qwiklabs-gcp-00-05a2418427e9-marking/task4-gcs-293.result

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

    $ gcloud ml language analyze-entities --content="Old Norse texts portray Odin as one-eyed and long-bearded, frequently wielding a spear named Gungnir and wearing a cloak and a broad hat." > task4-cnl-896.result

    $  gsutil cp task4-cnl-896.result gs://qwiklabs-gcp-00-05a2418427e9-marking/task4-cnl-896.result

## Video API

    $ gcloud iam service-accounts create quickstart
    $ gcloud iam service-accounts keys create key.json --iam-account quickstart@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com
    $ nano request.json
    {
       "inputUri":"gs://spls/gsp154/video/train.mp4",
       "features": [
           "TEXT_DETECTION"
       ]
    }
    
    $ curl -s -H 'Content-Type: application/json' \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    'https://videointelligence.googleapis.com/v1/videos:annotate' \
    -d @request.json > task4-gvi-956.result
    

Copy csv to cloud storage

    $ gsutil cp task4-gvi-956.result gs://qwiklabs-gcp-00-05a2418427e9-marking/task4-gvi-956.result
