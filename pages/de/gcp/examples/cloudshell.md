# Cloudshell

## Initialize

    $ gcloud auth list
    $ gcloud config list project
    
## Configure Environment

    $ gcloud config get-value compute/zone
    $ gcloud config get-value compute/region
    
    $ gcloud compute projecct-info desccribe --project <your_project_ID>
    
### Set Environment Variables

    $ export PROJECT_ID = <your_project_id>
    $ export ZONE = <your_zone>
    
    $ echo $PROJECT_ID
    $ echo $ZONE
    
## Create a VM with the Cloud Tool

    $ gcloud compute instances acreate gcelab2 --machine-type n1-standard2 --zone $ZONE
    
    $ gcloud compute instances create --help
    $ gcloud -h
    $ gcloud config --help
    $ gcloud help config

## Install new Component

    $ sudo apt-get install google-cloud-sdk
    $ gcloud beta interactive
    
## Connect to Instance

    $ gcloud compute ssh gcelab2 --zone $ZONE
