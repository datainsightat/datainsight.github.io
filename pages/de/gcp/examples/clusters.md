# Deploy Kubernetes Cluster

## Confirm that APIs are enabled

gcp > APIs and Services > Enabled APIs and Services

Check if "Kubernetes Engine API" and "Container Registry API" are enabled

## Start a Kubernetes Engine Cluster

Acitvate Cloud Shell

    $ export MY_ZONE=us-central1-a
    
    $ gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2
    
    $ kubectl version
    
gcp > Compute Engine > VM Instances

## Run and deploy a Container

    $ kubectl create deploy nginx --image=nginx:1.17.10
    
    $ kubectl get pods
    
    NAME                     READY   STATUS    RESTARTS   AGE
    nginx-7fcfdccc8d-2w2h7   1/1     Running   0          2m3s
    
## Expose Pod to the Internet

    $ kubectl expose deployment nginx --port 80 --type LoadBalancer
    
    $ kubectl get serivices
    
    NAME         TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)        AGE
    kubernetes   ClusterIP      10.52.0.1     <none>          443/TCP        9m4s
    nginx        LoadBalancer   10.52.1.135   34.133.204.98   80:31535/TCP   109s

## Scale up Services

    $ kubectl scale deployment nginx --replicas 3
    
    $ kubectl get pods
    
    NAME                     READY   STATUS    RESTARTS   AGE
    nginx-7fcfdccc8d-2w2h7   1/1     Running   0          4m44s
    nginx-7fcfdccc8d-6fcbj   1/1     Running   0          13s
    nginx-7fcfdccc8d-kjf4h   1/1     Running   0          13s
    
    $ kubectl get services
    
    NAME         TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)        AGE
    kubernetes   ClusterIP      10.52.0.1     <none>          443/TCP        11m
    nginx        LoadBalancer   10.52.1.135   34.133.204.98   80:31535/TCP   3m56s  
