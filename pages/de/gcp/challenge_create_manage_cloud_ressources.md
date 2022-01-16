# Create and Manage Cloud Ressources

## Initialize

    $ gcloud auth list
    $ gcloud config list project
    
## Create a Project Jumphost Instance

### Cloud Console

gcp > Compute Engine > Create Instance

* Name: nucleus-jumphost-540
* Regeion: us-east1
* Zone: us-east1-b
* series: N1
* Machine Type: f1-micro

### Shell

    $ gcloud compute instances create nucleus-jumphost-540 --machine-type f1-micro --zone us-east1-b

## Create a Kubernetes Service Cluster

### Setup Cluster

#### Cloud Console

gcp > Kubernetes Clusters > Create > GKE-Standard

* Name: nucleus-cluster-1
* Zone: us-east1-b

#### Shell

    $ gcloud config set compute/zone us-east1-b
    $ gcloud container clusters create nucleus-cluster-1

### Create Service
    
    $ gcloud container clusters get-credentials nucleus-cluster-1 --zone us-east1-b
    $ kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:2.0
    $ kubectl expose deployment hello-app --type=LoadBalancer --port 8082
    $ kubectl get service

#### Delete Service

    $ kubectl delete svc hello-app
    
## Create HTTP Load Balancer

### Create Template

    $ cat << EOF > startup.sh
    #! /bin/bash
    apt-get update
    apt-get install -y nginx
    service nginx start
    sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
    EOF
    
    $ gcloud compute instance-templates create nginx-template \
--metadata-from-file startup-script=startup.sh

### Target Pool

    $ gcloud compute target-pools create nginx-pool --region us-east1
    
### Managed Instance Group

    $ gcloud compute instance-groups managed create nginx-group \
    --base-instance-name nginx \
    --size 2 \
    --template nginx-template \
    --target-pool nginx-pool

    $ gcloud compute instances list

### Firewall Rule

    $ gcloud compute firewall-rules create grant-tcp-rule-340 --allow tcp:80
    
### Forward Rule

    $ gcloud compute forwarding-rules create nginx-lb \
    --region us-east1 \
    --ports=80 \
    --target-pool nginx-pool
    
    $ gcloud compute forwarding-rules list

### Health Check

    $ gcloud compute http-health-checks create http-basic-check
    $ gcloud compute instance-groups managed \
    set-named-ports nginx-group \
    --named-port http:80

### Backend Service

    $ gcloud compute backend-services create nginx-backend \
    --protocol HTTP --http-health-checks http-basic-check --global
    
    $ gcloud compute backend-services add-backend nginx-backend \
    --instance-group nginx-group \
    --instance-group-zone us-east1-b \
    --global
    
### URL Map

    $ gcloud compute url-maps create web-map \
    --default-service nginx-backend
    
    $ gcloud compute target-http-proxies create http-lb-proxy \
    --url-map web-map
    
### Forwarding Rule

    $ gcloud compute forwarding-rules create http-content-rule\
    --global \
    --target-http-proxy http-lb-proxy \
    --ports 80
    
    $ gcloud compute forwarding-rules list
