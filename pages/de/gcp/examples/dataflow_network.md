# Dataflow Network

## Initialize

### Create Cloud Storage Bucket

    $ PROJECT=`gcloud config list --format 'value(core.project)'`
    $ USER_EMAIL=`gcloud config list account --format "value(core.account)"`
    $ REGION=us-central1
    
    $ gsutil mb -p $PROJECT -b on gs://$PROJECT
    
### Setup Virtual Environment

    $  sudo apt-get install -y python3-venv
    $ python3 -m venv df-env
    $ source df-env/bin/activate

### Install Packages to Execute Pipeline

    $ python3 -m pip install -q --upgrade pip setuptools wheel
    $ python3 -m pip install apache-beam[gcp]
    
## Launch Dataflow Job

### Check IAM permissions

    $ gcloud projects get-iam-policy $PROJECT  \
    --format='table(bindings.role)' \
    --flatten="bindings[].members" \
    --filter="bindings.members:$USER_EMAIL"
    
### Attempt to Launch Job

    $ python3 -m apache_beam.examples.wordcount \
    --input gs://dataflow-samples/shakespeare/kinglear.txt \
    --output gs://$PROJECT/results/outputs --runner DataflowRunner  \
    --project $PROJECT --temp_location gs://$PROJECT/tmp/  \
    --region $REGION  
    
=> Missing IAM permissions

### Add Dataflow Admin Role

    $ gcloud projects add-iam-policy-binding $PROJECT --member=user:$USER_EMAIL --role=roles/dataflow.admin
    
    
### Attempt to Launch Job

    $ python3 -m apache_beam.examples.wordcount \
    --input gs://dataflow-samples/shakespeare/kinglear.txt \
    --output gs://$PROJECT/results/outputs --runner DataflowRunner  \
    --project $PROJECT --temp_location gs://$PROJECT/tmp/  \
    --region $REGION      
    
## Launch in Private IPs

### No Public IPs

    $ python3 -m apache_beam.examples.wordcount \
    --input gs://dataflow-samples/shakespeare/kinglear.txt \
    --output gs://$PROJECT/results/outputs --runner DataflowRunner  \
    --project $PROJECT  --temp_location gs://$PROJECT/tmp/  \
    --region $REGION \
    --no_use_public_ips --network default
    
 => PGA not turned on
 
### Turn on PGA
 
    $ gcloud projects add-iam-policy-binding $PROJECT --member=user:$USER_EMAIL --role=roles/compute.networkAdmin
    $ gcloud compute networks subnets update default \
    --region=$REGION \
    --enable-private-ip-google-access
    
### No Public IPs

    $ python3 -m apache_beam.examples.wordcount \
    --input gs://dataflow-samples/shakespeare/kinglear.txt \
    --output gs://$PROJECT/results/outputs --runner DataflowRunner  \
    --project $PROJECT  --temp_location gs://$PROJECT/tmp/  \
    --region $REGION \
    --no_use_public_ips --network default
