# Cloud Shell

## General

    $ gcloud auth list
    $ gcloud config list project

## Set Zone

    $ gcloud config get-value compute/zone
    $ gcloud config get-value compute/region
  
    $ gcloud compute project-info describe --project qwiklabs-gcp-01-c87df1f33620
    $ export PROJECT_ID=qwiklabs-gcp-01-c87df1f33620
    $ export ZONE=europe-west1-d
  
## Create VM

    $ gcloud compute instances create gcelab2 --machine-type n1-standard-2 --zone $ZONE
  
## Help

    $ gcloud compute instances create --help
    
## Install new Component

    $ sudo apt-get install google-cloud-sdk
    $ gcloud beta interactive
    $ gcloud compute instances describe gcelab2
    
## Connect to VM with ssh

    $ gcloud compute ssh gcelab2 --zone $ZONE
    
## User Home directory

    $ cd $HOME
    § vi ./.bashrc

# Compute Options

![Compute Options](../img/gcp_compute_options.png)
