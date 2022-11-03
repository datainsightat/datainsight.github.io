# Environment

## Get Project ID

    gsutil mb -l $LOCATION gs://$DEVSHELL_PROJECT_ID
    
# Create Bucket

    gsutil mb -l $LOCATION gs://$DEVSHELL_PROJECT_ID
    
# File Manipulation

## Copy

    gsutil cp gs://cloud-training/gcpfci/my-excellent-blog-png my-excellent-blog.png

## Access Control

    gsutil acl ch -u allUsers:R gs://$DEVSHELL_PROJECT_ID/my-excellent-blog.png
    
