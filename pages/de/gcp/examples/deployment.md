# Deployment Manager and Monitoring

## Check, if APIs are enables

gcp > APIs & services > Enabled APIs and Services

* Cloud Deployment Manager v2 API
* Cloud Runtime Configuration API
* Stackdriver monitoring API
</a>

## Create a Deployment Manager Deployment

    $ export MY_ZONE=us-east1-c
    
    $ gsutil cp gs://cloud-training/gcpfcoreinfra/mydeploy.yaml mydeploy.yaml
    
    $ sed -i -e "s/PROJECT_ID/$DEVSHELL_PROJECT_ID/" mydeploy.yaml
    $ sed -i -e "s/ZONE/$MY_ZONE/" mydeploy.yaml
    $ cat mydeploy.yaml
    
    resources:
    - name: my-vm
      type: compute.v1.instance
      properties:
        zone: us-east1-c
        machineType: zones/us-east1-c/machineTypes/n1-standard-1
        metadata:
          items:
          - key: startup-script
            value: "apt-get update"
        disks:
        - deviceName: boot
          type: PERSISTENT
          boot: true
          autoDelete: true
          initializeParams:
            sourceImage: https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20180806
        networkInterfaces:
        - network: https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-dcdf854d278b50cd/global/networks/default
          accessConfigs:
          - name: External NAT
            type: ONE_TO_ONE_NAT

## Build a Deployment from the Template

    $ gcloud deployment-manager deployments create my-first-depl --config mydeploy.yaml

gcp > Compute Engine > VM instances

## Update Deployment Manager Deployment

    $ nano mydeploy.yaml
    
    value: "apt-get update; apt-get install nginx-light -y"
    
    $ gcloud deployment-manager deployments update my-first-depl --config mydeploy.yaml

gcp > Compute Engine > VM instances

## View the Load on a VM using Cloud Monitoring

gcp > Compute Engine > VM instances

my-vm > STOP
my-vm > edit > Service account > Compute Engine default service account > Allow full access to all Cloud APIs > Save
my-vm > START

my-vm > SSH

    my-vm $ dd if=/dev/urandom | gzip -9 >> /def/null &

## Create a Monitoring Workspace

gcp > Monitoring

### Install Monitoring and Logging Agents

    my-vm $ curl -sSO https://dl.google.com/cloudagents/install-monitoring-agent.sh
    my-vm $ sudo bash install-monitoring-agent.sh
    
    my-vm $ curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
    my-vm $ sudo bash install-logging-agent.sh
    
gcp > Monitoring > Metrics Explorer > VM INstance > CPU usage > Apply

    my-vm $ kill %1
