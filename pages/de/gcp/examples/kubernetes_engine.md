# Kubernetes Engine

## Initialize

    $ gcloud auth list
    $ glcoud config list project
    
    $ gcloud config set compute/zone us-central1-a
    
## Create GKE Cluster

    $ gcloud container clusters create [CLUSTER NAME]
    
## Get Authentication Credentials

    $ gcloud container clusters get-credentials [CLUSTER-NAME]
    
## Deploy Application

    $ kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0

## Create Kubernetes Service

    $ kubectl expose deployment hello-server --type=LoadBalancer --port 8080
    $ kubectl get service

## View Application

http://[EXTERNAL_IP]:8080

## Delete Cluster

    $ gcloud container clusters delete [CLUSTER-NAME]
