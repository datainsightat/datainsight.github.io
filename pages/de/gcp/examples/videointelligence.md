# Video Intelligence

## Initialize

    $ gcloud auth list
    $ gcloud config list project
    
## Setup Authorization

    $ gcloud iam service-accounts create quickstart
    $ gcloud iam service-accounts keys create key.json --iam-account quickstart@qwiklabs-gcp-03-91a2c381591a.iam.gserviceaccount.com
    $ gcloud auth activate-service-account --key-file key.json
    $ gcloud auth print-access-token

## Make an annodated Video request

    $ cat > request.json <<EOF
    {
       "inputUri":"gs://spls/gsp154/video/train.mp4",
       "features": [
           "LABEL_DETECTION"
       ]
    }
    EOF
    
    $ curl -s -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$(gcloud auth print-access-token)'' \
    'https://videointelligence.googleapis.com/v1/videos:annotate' \
    -d @request.json
    
    {
      "name": "projects/622625579645/locations/us-east1/operations/6718467585709002627"
    }
    
    $ curl -s -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$(gcloud auth print-access-token)'' \
    'https://videointelligence.googleapis.com/v1/projects/PROJECTS/locations/LOCATIONS/operations/OPERATION_NAME'
    
    {
        "name": "projects/425437283751/locations/asia-east1/operations/17938636079131796601",
        "metadata": {
          "@type": "type.googleapis.com/google.cloud.videointelligence.v1.Annota
      tionProgressMetadata",
          "progressMetadata": [
            {
              "inputUri": "gs://spls/gsp154/video/train.mp4",
              "startTime": "2016-09-22T21:41:56.766091Z",
              "lastUpdateTime": "2016-09-22T21:42:03.889743Z"
            }
          ]
        },
        ...
    }
    
    
