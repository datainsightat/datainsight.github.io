# Dataproc Console

## Initialize

    $ gcloud auth list
    $ gcloud config list project
    
## Create Cluster

    $ gcloud config set dataproc/region us-central1
    $ gcloud dataproc clusters create example-cluster --worker-boot-disk-size 500
   
## Submit a Job

    $ gcloud dataproc jobs submit spark --cluster example-cluster \
    --class org.apache.spark.examples.SparkPi \
    --jars file:///usr/lib/spark/examples/jars/spark-examples.jar -- 1000
    
## Update Cluster

    $ gcloud dataproc clusters update example-cluster --num-workers 4
