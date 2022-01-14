
# What is AI?

AI > Machine Learning > Deep Learning  

![ML](../../img/gcp_ai_1.jpg)  

## From Ad-how Data Analysis to Data-Driven Devisions

Ad-How:
* Manual, repetitive work
* Any decision is based on hunches how factors interact
<a/>

=> Build forecasting ML Models

## Options for ML Models

![ML Models](../../img/gcp_ai_2.jpg)  

## Notebooks

Customize hardware for your specific notebook needs.  

![Notebooks](../../img/gcp_ai_7.jpg)  

![Notebooks Hardware](../../img/gcp_ai_8.jpg) 

### BigQuery Magic

BigQuery result is saved in pandas dataframe 'df'. Be aware that memory is limited in notebooks.  

    %%biquery df
    select
      *
    from
      ...
    limit
      50

# ML on Unstructured Data

Unstructured data is about 90% of a companies data.  

![ML Models](../../img/gcp_ai_3.jpg)  

ML can automate tasks.  

![Deep Learning](../../img/gcp_unstructured_1.png)

Different approaches to AI. You need 100k+ Datapoints to train your own model.

![AI Application Strategy](../../img/gcp_unstructured_2.png)

## Prebuild Models

### Natural Language API

![ML Models](../../img/gcp_ai_4.jpg)  

#### Enitity analysis

* Locations
* People
* Artwork
* Consumer Products
* Addresses
* Numbers (Prices, Phone numbers, Dates ..)
<a/>

#### Sentiment Analysis

![ML Models](../../img/gcp_ai_5.jpg)

#### Entity Sentiment Analysis

Sentiment analysis on each eantity of a document.

### Content Classification

* Sports
* Foods
* Literature
<a/>

### Vision API

![Vision API](../../img/gcp_unstructured_3.png)

### Translate API

![Translate API](../../img/gcp_unstructured_4.png)

### Language API

Sentiment Analysis

![Sentiment](../../img/gcp_unstructured_5.png)

### Speech API

![Speech](../../img/gcp_unstructured_6.png)

### Video Intelligence API

![Video](../../img/gcp_unstructured_7.png)

## Dialog Flow

Natural Language understanding API.

![Dialog Flow](../../img/gcp_unstructured_8.png)

Prebuilt Chatbots

![Dialog Flow](../../img/gcp_unstructured_9.png)

## AutoML

![AI](../../img/gcp_ai_9.jpg)

* Train
    * Dataset preparation
    * Readiness Analysis
    * Train
    * Test and Evaluate   
* Deploy
* Server
    * Predict
    * Classify
<a/>

### Process

#### Prepared Dataset to train custom Model

![Process](../../img/gcp_ai_10.jpg)

#### Preliminary Analysis

![Analysis](../../img/gcp_ai_11.jpg)

One full run through all training data is called 'epoch'.

#### Evaluation

![Analysis](../../img/gcp_ai_12.jpg)

#### Activate Model

![Activation](../../img/gcp_ai_13.jpg)

#### Serve Model

![Classification](../../img/gcp_ai_14.jpg)

### Multiple Models

![Multiple Models](../../img/gcp_ai_15.jpg)

### AutoML Products

#### AutoML Vision

AutoML takes more time to come up with a model, due to ensemble learning.

![Auto ML](../../img/gcp_unstructured_10.png)  
![Auto ML](../../img/gcp_unstructured_11.png)  
![Auto ML](../../img/gcp_unstructured_12.png)  

|Attribute|AutoML Vision|Vision API|
|-|-|-|
|Objective|Enabling developers with no ML expertise to build ML models|Enable ML practitiones to use Googles ML|
|Primary use|Classification|Face detection, OCR ...|
|Data|Images with Labels|Justt Images|

##### Process

![AutoML Vision](../../img/gcp_ai_17.jpg)  

##### Improving Data

![Improving Data](../../img/gcp_ai_18.jpg)  

### AutoML Natural Language

#### Process

![AutoML Natural Language](../../img/gcp_ai_19.jpg) 

##### Improving Data

![Improving Data](../../img/gcp_ai_20.jpg) 

### AutoML Tables

![AutoML Table](../../img/gcp_ai_21.jpg) 

#### Price Suggestions

![Price Suggestions](../../img/gcp_ai_22.jpg)

## Custom Models

* BigQuery ML
* TensorFlow, Keras

Model Quality: Custom Model > AutoML > BigQueryML

## Make or Buy Models?

![MOB](../../img/gcp_ai_16.jpg)

## BigQuery ML, AutoML or Custom Model?

![Which Ml Tools](../../img/gcp_ai_23.jpg)
