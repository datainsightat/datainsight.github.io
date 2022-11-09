# Appengine

## Setup

    $ gcloud auth list
    $ gcloud config list project
    
## Initlialize App Engine

    $ gcloud app create --project=$DEVSHELL_PROJECT_ID
    $ git clone https://github.com/GoogleCloudPlatform/python-docs-samples
    $ cd python-docs-samples/appengine/standard_python3/hello_world
    
## Run Hello World locally

    $ touch Dockerfile
    $ sudo nano Dockerfile
    
    FROM python:3.7
    WORKDIR /app
    COPY . .
    RUN pip install gunicorn
    RUN pip install -r requirements.txt
    ENV PORT=8080
    CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app
    
    $ docker build -t test-python .
    
    $ docker run --rm -p 8080:8080 test-python
    
    $ docker build -t test-python .
    
    $ docker run --rm -p 8080:8080 test-python

Web preview > preview on port 8080

gcp > App Engine > Dashboard

No resources are deployed

## Deploy and run Hello World on App Engine

    $ cd ~/python-docs-samples/appengine/standard_python3/hello_world
    
    $ gcloud app deploy

    $ gcloud app browse

## Disable the application

gcp > App Engine > Settings

Disable application


    
