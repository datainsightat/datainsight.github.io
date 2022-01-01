# Recommendation Systems

## Concepts

Data > Model > Infrastructure

Google: RankBrain (ML for search ranking)

? How to find a similar user ?

![Recommend 1](../../img/gcp_recommend_1.png)

## Objectives

* Create Cloud SQL instance and populate tables.
* Explore the rentals data using SQL from Cloud Shell
* Launch Dataproc
* Train and apply machine learning model written in PySpark
* Explore inserted rows

## Architecture

? How often should you compute the model ?

Dump user ratings in Hadoop Cluster. About 5 Mio Lines of can be stored in a realational DB.

![Recommend 2](../../img/gcp_recommend_2.png)

![Recommend 9](../../img/gcp_recommend_9.png)

#

## Create SQL DB

gcp > SQL > Create Instance > MySQL  
Connect to this instance > Cloud SQL

    $ gcloud sql connect rentals --user=root --quiet
    
    mysql> SHOW DATABASES;
    
    mysql> CREATE DATABASE IF NOT EXISTS recommendation_spark;
    mysql> USE recommendation_spark;
    mysql> DROP TABLE IF EXISTS Recommendation;
    mysql> DROP TABLE IF EXISTS Rating;
    mysql> DROP TABLE IF EXISTS Accommodation;
    
    mysql> CREATE TABLE IF NOT EXISTS Accommodation
            (
              id varchar(255),
              title varchar(255),
              location varchar(255),
              price int,
              rooms int,
              rating float,
              type varchar(255),
              PRIMARY KEY (ID)
            );
            
    mysql> CREATE TABLE  IF NOT EXISTS Rating
            (
              userId varchar(255),
              accoId varchar(255),
              rating int,
              PRIMARY KEY(accoId, userId),
              FOREIGN KEY (accoId)
                REFERENCES Accommodation(id)
            );
            
    mysql> CREATE TABLE  IF NOT EXISTS Recommendation
            (
              userId varchar(255),
              accoId varchar(255),
              prediction float,
              PRIMARY KEY(userId, accoId),
              FOREIGN KEY (accoId)
                REFERENCES Accommodation(id)
            );
            
    mysql> SHOW DATABASES;
            
    mysql> USE recommendation_spark;
    mysql> SHOW TABLES;
    mysql> SELECT * FROM Accommodation;
      
 ## Stage Data in Cloud Storage
 
 Check, if cloud storage bucket exists:  
 gcp > Storage > Cloud Storage > Browser > Create Bucket
 
    $ echo "Creating bucket: gs://$DEVSHELL_PROJECT_ID"
    $ gsutil mb gs://$DEVSHELL_PROJECT_ID
    $ echo "Copying data to our storage from public dataset"
    $ gsutil cp gs://cloud-training/bdml/v2.0/data/accommodation.csv gs://$DEVSHELL_PROJECT_ID
    $ gsutil cp gs://cloud-training/bdml/v2.0/data/rating.csv gs://$DEVSHELL_PROJECT_ID
    $ echo "Show the files in our bucket"
    $ gsutil ls gs://$DEVSHELL_PROJECT_ID
    $ echo "View some sample data"
    $ gsutil cat gs://$DEVSHELL_PROJECT_ID/accommodation.csv
    
## Load data from Cloud Storage to SQL

SQL > rentals > import
