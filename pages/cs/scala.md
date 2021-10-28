# General

## Variables

var: Variable can be changed  
val: Variable can not be changed  

    scala > var myVarialbe1: Int = 3
    scala > val myVariable2: Double = 3
    scala > var myVariable3: Straing = "Big"
    
    scala > val varlable 1 = s"${myVariable3} Data"
    scala > printf("Examples of integer %d and string %s ",5," "Big Data")
    
## Data Strucutres

An array is a fixes size data structure

    scala > var myArray1 = Array[String](3)
    scala > myArray1(0) = "a"
    
    scala > val myList = List(10,20,30,40)
    scala > val myList = List(10,20,"Big Data",40)
    
    scala > val mypValue = Map(("key1",10),("key2",20))
    
## Logic

    if (10=10) {
      println("inside if")
    } else if (10==7) {
      pritnln("inside elif")
    } else {
      println("inside else")
    }
    
    for (i <- 1 to 10)
    {
      println(i)
    }
    
    for (i <-1 until 5)
    {
      println(i)
    }
    
    for (i <- List(10,20,30,40))
    {
      println(i)
    }
    
    var i = 1
    while (i<5) {
      println(i)
      i = i + 1
    }
    
## Functions

    def sampleFunction() : Unit = {
      println("Big Data")
      return 1
    }
   
    def calculateSum (i:Int, j:Int) : Int =  {
      val k = i +j
      return k
    }

# Working with Spark Dataframes

## Get Data in hdfs

    $ wget https://raw.githubusercontent.com/futurexskill/bigdata/master/retailstore.csv
    $ hadoop fs -mkdir /user/newuser
    $ hadoop fs -mkdir /user/newuser/data
    $ hadoop fs -put retailstore.csv /user/newuser/data
    $ spark-shell
    
## Read csv
    
    scala > val customerDF = spark.read.csv("data/retailsotre.csv")
    scala > customerDF.show()
    scala > val customerDF = spark.read.option("header","true").csv("data/retailstore.csv")
    
## Dataframe Options

    scala > customerDF.show()
    scala > customerDF.head()
    scala > customerDF.groupBy("Gender").count()
    scala > customerDF.describe().show()
    scala > customerDF.select("country").show()
    scala > customerDF.groupBy("country").count().show()
    
    scala > customerDF.filter("Salary > 30000").select("Age","Country").show()
    
## SQL Queries

    scala > customerDF.createOrReplaceTempView("customer")
    scala > val results = spark.sql("select * from customer")
    scala > results.show()
    
## Group Functions

    scala > customerDF.groupBy("gender").max().show()
    scala > customerDF.select(avg("salary")).show()
    scala > customerDF.select(stddev("salary")).show()
    
## Clean Data

    scala > customerDF.na.fill(0).show()
    scala > customerDF.na.drop().show()
    
    
