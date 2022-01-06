# Dataprep

## Create Cloud Storage Bucket

gcp > Cloud Storage > Browser > Create Bucket

## Initialize Cloud Dataprep

gcp > Dataprep

## Create Flow

Flows > Create > Blank Flow  

Add Dataset > Imported Datasets  

Cloud Storage > Choose File or Folder > "gs://spls/gsp105" > "us/fec/cn-2016.txt", "itcont-2016.txt" > Add & Import  

![Dataflow](../../../img/gcp_dataflow_1.png)

Edit Recipe > Add Filter DATE(2016,1,1) >= column5 < DATE(2018,1,1)  

column6 > Change Type > String  

FEC 2016 > itcont-2016.txt > Add Receipe > Edit > "replacepatterns col: * with: '' on: `{start}"|"{end}` global: true"  

New Step > Join Datasets > cn-2016.txt > Inner Join column2 = column 11 > Review > Add to Receipe  

New Step > "pivot value:sum(column16),average(column16),countif(column16 > 0) group: column2,column24,column8"  

New Step > "rename type: manual mapping: [column24,'Candidate_Name'], [column2,'Candidate_ID'],[column8,'Party_Affiliation'], [sum_column16,'Total_Contribution_Sum'], [average_column16,'Average_Contribution_Sum'], [countif,'Number_of_Contributions']"  

New Step > "set col: Average_Contribution_Sum value: round(Average_Contribution_Sum)"

![Dataflow Result](../../../img/gcp_dataflow_2.png)
