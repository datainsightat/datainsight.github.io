# Google Cloud Speech API

## Initialize

    $ gcloud auth list
    $ gcloud config list project
    
## Create API Key

gcp > APIs & Services > Credentials > Creat Credentials > API Key > AIzaSyBfnXOuvhmhmvqZ0aJRXvRkXMrMrElpF8k  
gcp > Compute Engine > ssh

    $ export API_KEY=AIzaSyBfnXOuvhmhmvqZ0aJRXvRkXMrMrElpF8k

## Create Speech API request

    $ touch request.json
    $ nano request.json
    
    {
      "config": {
          "encoding":"FLAC",
          "languageCode": "en-US"
      },
      "audio": {
          "uri":"gs://cloud-samples-tests/speech/brooklyn.flac"
      }
    }
    
 ## Call Speech API
 
    $ curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json \
"https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" > result.json
    $ cat result.json

    {
      "results": [
        {
          "alternatives": [
            {
              "transcript": "how old is the Brooklyn Bridge",
              "confidence": 0.9828748
            }
          ],
          "resultEndTime": "1.770s",
          "languageCode": "en-us"
        }
      ],
      "totalBilledTime": "15s"
    }
