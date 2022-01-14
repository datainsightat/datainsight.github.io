# Natural Language API

## Initlialize

    $ gcloud auth list
    $ gcloud config list project
    
## Enable Cloud Natural Language API

gcp > APIs > Cloud Natural Language API > Disable API  
gcp > APIs > Cloud Natural Language API > Enable

## Create API Key

gcp > APIs > Create Credentials > API key > AIzaSyCVnDlXlm1s2Ex2G2kGLkBuwzgIplmMTzM > Restrict Key

    $ export API_KEY=AIzaSyCVnDlXlm1s2Ex2G2kGLkBuwzgIplmMTzM
    
## Classify News Articles

    $ nano request.json
    
    {
      "document":{
        "type":"PLAIN_TEXT",
        "content":"A Smoky Lobster Salad With a Tapa Twist. This spin on the Spanish pulpo a la gallega skips the octopus, but keeps the sea salt, olive oil, pimentón and boiled potatoes."
      }
    }

    $ curl "https://language.googleapis.com/v1/documents:classifyText?key=${API_KEY}" \
    -s -X POST -H "Content-Type: application/json" --data-binary @request.json
    
## Classify Large Dataset

    $ gsutil cat gs://cloud-training-demos-text/bbc_dataset/entertainment/001.txt
    
### Create BiqQuery Table

gcp > BigQuery > qwiklabs-gcp-01-ebe42cbc1f39 > create Dataset > news_classification_dataset  
news_classification_dataset > create Table > article_data

![Table](../../../img/gcp_ai_6.jpg)

### Classify New Data & Store in BigQuery

    $ export PROJECT=qwiklabs-gcp-01-ebe42cbc1f39

#### Get Credentials

    $ gcloud iam service-accounts create my-account --display-name my-account
    $ gcloud projects add-iam-policy-binding $PROJECT --member=serviceAccount:my-account@$PROJECT.iam.gserviceaccount.com --role=roles/bigquery.admin
    $ gcloud iam service-accounts keys create key.json --iam-account=my-account@$PROJECT.iam.gserviceaccount.com
    $ export GOOGLE_APPLICATION_CREDENTIALS=key.json
    
#### Write Code
    
    $ nano classify-text.py
    
    from google.cloud import storage, language_v1, bigquery

    # Set up our GCS, NL, and BigQuery clients
    storage_client = storage.Client()
    nl_client = language_v1.LanguageServiceClient()

    # TODO: replace YOUR_PROJECT with your project id below
    bq_client = bigquery.Client(project='qwiklabs-gcp-01-ebe42cbc1f39')
    dataset_ref = bq_client.dataset('news_classification_dataset')
    dataset = bigquery.Dataset(dataset_ref)
    table_ref = dataset.table('article_data') # Update this if you used a different table name
    table = bq_client.get_table(table_ref)

    # Send article text to the NL API's classifyText method
    def classify_text(article):
            response = nl_client.classify_text(
                    document=language_v1.types.Document(
                            content=article,
                            type_='PLAIN_TEXT'
                    )
            )
            return response
    rows_for_bq = []
    files = storage_client.bucket('cloud-training-demos-text').list_blobs()
    print("Got article files from GCS, sending them to the NL API (this will take ~2 minutes)...")

    # Send files to the NL API and save the result to send to BigQuery
    for file in files:
            if file.name.endswith('txt'):
                    article_text = file.download_as_bytes()
                    nl_response = classify_text(article_text)
                    if len(nl_response.categories) > 0:
                            rows_for_bq.append((str(article_text), str(nl_response.categories[0].name), nl_response.categories[0].confidence))
    print("Writing NL API article data to BigQuery...")

    # Write article text + category data to BQ
    errors = bq_client.insert_rows(table, rows_for_bq)
    assert errors == []
    
#### Run Code
    
    $ python3 classify-text.py
    
#### Verify Result

gcp > BigQuery

    SELECT
      *
    FROM
      `news_classification_dataset.article_data`;

#### Analyze

    SELECT
      category,
      COUNT(*) c
    FROM
      `news_classification_dataset.article_data`
    GROUP BY
      category
    ORDER BY
      c DESC;
     
    SELECT
      *
    FROM
      `news_classification_dataset.article_data`
    WHERE
      category = "/Arts & Entertainment/Music & Audio/Classical Music";
      
    SELECT
      article_text,
      category
    FROM
      `news_classification_dataset.article_data`
    WHERE
      cast(confidence as float64) > 0.9;
