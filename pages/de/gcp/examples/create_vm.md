# Create a Virual Machine

## Initialize

     $ gcloud auth list
     $ gcloud config list project

## Create new VM Instance

gcp > Compute Engine > VM Instances > Create Instance

### Install NGINX web server

    $ sudo su -
    $ apt-get update
    
    $ apt-get install nginx -y
    
    $ ps auwx | grep nginx

## Create new Instance with gcloud

    $ gcloud compute instance create gcelab2 --machineptype n1-standard-2 --zone us-central-f
    
### Connect to Instance

    $ gcloud compute ssh gcelab2 --zone us-central-f
