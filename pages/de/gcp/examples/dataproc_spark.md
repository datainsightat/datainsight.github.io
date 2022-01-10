# Running Spark Jobs on Dataproc

[Jupyter Notebook](https://github.com/datainsightat/DataScience_Examples/blob/main/de/Spark/gcp_dataprog_spark.ipynb)

## Initialize

    $ gcloud auth list
    $ gcloud config list project

## Lift & Shift

gcp > Dataproc > Create Cluster sparktodp  

* Versioning: Debian 10, Hadoop 3.2, Spark 3.1
* Components: Enable component gateway
* Optional Components: Jupyter Notebook
<a/>

### Clone Source Repo

    $ git -C ~ clone https://github.com/GoogleCloudPlatform/training-data-analyst
    $ export DP_STORAGE="gs://$(gcloud dataproc clusters describe sparktodp --region=us-central1 --format=json | jq -r '.config.configBucket')"
    $ gsutil -m cp ~/training-data-analyst/quests/sparktobq/*.ipynb $DP_STORAGE/notebooks/jupyter

### Start Jupyter Notebook

Cluster > Webinterfaces > Jupyter > GCS > 01_spark.ipynb

## Separate Compute and Storage

Create new storage bucket

    $ export PROJECT_ID=$(gcloud info --format='value(config.project)')
    $ gsutil mb gs://$PROJECT_ID
    
Copy source data into bucket

    $ wget https://archive.ics.uci.edu/ml/machine-learning-databases/kddcup99-mld/kddcup.data_10_percent.gz
    $ gsutil cp kddcup.data_10_percent.gz gs://$PROJECT_ID/
    
Make a copy of the Jupyter notebook and replace the code in "Reading the data"

    from pyspark.sql import SparkSession, SQLContext, Row
    gcs_bucket='qwiklabs-gcp-02-d594c1a692f7'
    spark = SparkSession.builder.appName("kdd").getOrCreate()
    sc = spark.sparkContext
    data_file = "gs://"+gcs_bucket+"//kddcup.data_10_percent.gz"
    raw_rdd = sc.textFile(data_file).cache()
    raw_rdd.take(5)
    
## Deploy Spark Jobs

Add '%%writefile -a spark_analysis.py' in front of code cells

    $ gsutil cp gs://$PROJECT_ID/sparktodp/spark_analysis.py spark_analysis.py
    $ nano submit_onejob.sh
    #!/bin/bash
    gcloud dataproc jobs submit pyspark \
           --cluster sparktodp \
           --region us-central1 \
           spark_analysis.py \
           -- --bucket=$1
     $ chmod +x submit_onejob.sh
     $ ./submit_onejob.sh $PROJECT_ID
