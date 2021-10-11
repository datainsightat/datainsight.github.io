# Create Cluster

GCP > DataProc > Creat Cluster > VM Instances > SSG

# Read CSV file into Hadoop Cluster

     $ wget https://raw.githubusercontent.com/futurexskill/bigdata/master/bank_prospects.csv
     $ ls
     $ hadoop fs -mkdir /user/newuser
     $ hadoop fs -mkfir /user/newuser/data
     $ hadoop fs -put bank_prospects.csv /user/newuser/data/
     $ hadoop fs -ls data
     
# ETL using pyspark
     
     $ pyspark
     >>> bankProspectDF = spark.read.csv('data/bank_prospects.csv', header=True)
     >>> bankProspectDF.show()
     >>> bankprospectDF1 = bankProspectDF.filter(bankProspectDF['country'] != 'unknown')
     >>> bankprospectDF1.show()
     >>> from pyspark.sql.types import IntegerType,FloatType
     >>> bankprospectDF2 = bankprospectDF1.withColumn('age', bankprospectDF1['age'].cast(IntegerType())).withColumn('salary', bankprospectDF1['salary'].cast(FloatType()))
     >>> from pyspark.sql.functions import mean
     >>> mean_age_val = bankprospectDF2.select(mean(bankprospectDF2['age'])).collect()
     >>> mean_age = mean_age_val[0][0]
     >>> mean_salary_val = bankprospectDF2.select(mean(bankprospectDF2['salary'])).collect()
     >>> mean_salary = mean_salary_val[0][0]
     >>> bankprospectDF3 = bankprospectDF2.na.fill(mean_age,['age'])
     >>> bankprospectDF4 = bankprospectDF3.na.fill(mean_salary,['salary'])
     >>> bankprospectDF4.show()
     >>> bankprospectDF4.write.format('csv').save('bank_prospects_transformed')
     >>> exit()
     $ hadoop fs -ls bank_prospects_transformend
     
# Create Hive Table

    $ hive
    hive> create table bankprospectcleaned (age int, salary float, gender string, country string, purchased string) row format delimited fields terminated by ',' location '/user/mayrhofer_b/bank_prospects_transformed';
    hive> select * from bankprospectcleaned;
    
# Create Python file

    $ nano bank_pro
    
    from pyspark.sql.import SparkSession
    spark = Sparksession.builder.appName('SparkDFDemo').getOrCreate()
    
    bankprospectDF = spark.read.csv('/user/newuser/data/bank_prospects.csv', header=True)
    bankprospecDF1 = bankprospectDF.filter(banlprospecDF['Country'] != 'unknown'
    
    from pyspark.sql.types import intergerType,FloatType
    
    bankprospectDF2 = bankprospectDF1.withColumn('age', bankprospectDF1['age'].cast(IntergerType())).withcolumn('salary', bankprospectDF1['salary'].cast(FloatType()))
    
    from pyspark.sql.functions import mean
    
    mean_age_val = bankProspectsDF2.select(mean(bankProspectsDF2['age'])).collect()
    mean_age = mean_age_val[0][0]

    mean_salary_val = bankProspectsDF2.select(mean(bankProspectsDF2['salary'])).collect()
    mean_salary = mean_salary_val[0][0]

    bankbankProspectsDF3 = bankProspectsDF2.na.fill(mean_age,["age"])
    bankbankProspectsDF4 = bankbankProspectsDF3.na.fill(mean_salary,["salary"])

    bankbankProspectsDF4.write.format("csv").save("bank_prospects_transformed")

    $ spark-submit bank_prospects.py
