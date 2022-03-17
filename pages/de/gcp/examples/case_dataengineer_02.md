# Case Study 02

## Requirements

Capture data reading and update events to know, who, what, when and where.  
Separation of who manages the data and who can read the data.  
Allocate costs appropriately; costs to read/process vs. costs to store.  
Prevent exfiltration of data to other Google Cloud projects and to external systems.  

## Solution

All access to data should be captured in audit logs.  
All access to data should be managed via IAM.  
Configure service perimeters with VPC service controls.  

![case](../../../img/gcp_de_exam_48.jpg)

Each group was isolated in separate projects and aollowd limited access between them using VPC Service Controls. BiqQuers allows separation of access by role, so we were able to limit some roles to only loading data and other to only runnig queries. Some groups were able to run queries in their own project using datasets for which they only had read access, and the data was stored in a separate repository. We made sure that at the folder level of the resource hierarchy, we had aggregated log exports enabled. That ensured that even if you were the owner of a project and had the avility to redirect exports, you wouldn't be able to do so with specifig exports, because those rights were set at the folder leve, where most team members didn't have access. So by using aggregated log exports we were able to scoop up all the logs, store them in cloud storage, and create a record of who is running what query at what time against the dataset.  
The VPC perimeter enables us to allow APIs within the perimeter to run and only talk with other APIs belonging to other projects wihin the same perimeter.  
So if somene had a separate project and started a BigQuery job that was to read from a dataset wihin the perimeter, even though they have credentials and access to the dataset, they would not be able to use the queries, because the APIs would not allow it at the perimeter.
