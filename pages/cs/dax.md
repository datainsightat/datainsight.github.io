# [DAX (Data Analysis Expressions)](https://docs.microsoft.com/en-us/dax/)

Measures, or calculated columns? Measures are your first choice, because they are lightweight, scalable. You need a calculated column, if there is no key column, or you need another way to group or slice data.

![DAX](../../img/pbi_16.jpg)

* Date and time functions
* Filter functions
* Financial functions
* Information functions
* Logical functions
* Math functions
* Parent and child functions
* Relationship functinons
* Statistical functions
* Table manuipulatoin functions
* Text functions
* Time intelligence functions
<a/>

# Syntax

    'Table'
    [Column]
    Function()
    // Your comment here //
    && and
    || or
    
    Target = if([Trend] < 100 && [Trend] > 75, "Goal Exceeded",
                if([Trend] > 50 && [Trend] <= 75, "Goal Met",
                    if([Trend] < 75, "Goal Not Met", ""
    )))
    
## Aggregating Functions vs Iterating Functions

Aggregating functions only evaluate columns (SUM, AVERAGE). Iterating functions can calculate row by row (SUMX, AVERAGEX)

    sum(column required)
    sumx(table, expression)

## Implicit Measures

Implicit DAX functions (Applied by right-clicking) can only be used on aggregate columns, which are shown by the "E"-Symbol.

## Quick Measures

Use Quick Measures to learn DAX syntax.

    Colum = TOTALYTD(SUM('Week 1 Sales'[Sales Total]), 'Date'[Date])

## Explicit Measures

### Calculation Functions

#### CALCULATE()

Performs a calculation with certain filters.

    calculate(sum([Column]),[Column]>10)

    = Calculate(SUM('Table'[Column]),FILTER(1),FILTER(2))
    
    = Calculate(Sum('Sales'[QTY]),'Product'[Category]="Vegetables")
    
    = Calculate(Sum('Sales'[QTY]),All())
    = Calculate(Sum('Sales'[QTY]),All('Product'[Category]))
    
    Total Amount Apples = Calculate(Sum('Sales'[Amount]),'Product'[Commodity]="Apples")
    
    All Sales ever = CALCULATE(SUM('Sales Transactions'[Amt]),ALL())
    Benchmark 2018 = CALCULATE(SUM('Sales Transactions'[Amt]), FILTER('Date','Date'[Year]=2018)). 
    Benchmark TX 2018 = CALCULATE(SUM('Sales Transactions'[Amt]),'Date'[Year]=2018, 'Customer Data'[State]="Texas")
    
#### COUNT()

   count([Column])
   
#### COUNTX()

   countx('Table',Expression)
   
#### DISTINCTCOUNT()

   distinctcount([Column])

#### SUMX()

* Iterates across individual rows
* Sums the output of your function, row by row
<a/>

    = SumX('Table',<Expression>)
 
    = SumX('Table',[field in table] * [diff. field in table])
    = SumX('Sales',[Sales Quantity] * [Price Ea])
 
    = SumX('Table',[field in table] * Related([field in diff. table]))
    = SumX('Sales',[Sales Quantity] * Related('Product'[Price Ea]))
    
    = SumX(Filter('Sales',Related([Commodity]="Apples")),[Amount]*[Cost Ea])
 
    Sales Amount = SUMX('Sales Transactions',[Price ea]*[Amt])
    Sales Amount = SUMX('Sales Transactions',[Price ea]*[Amt])
    Sales Amount2 = SUMX('Sales Transactions',[Amt]*RELATED('Product Data'[Price ea]))
    Sales in Texas = Sales Texas = SUMX(FILTER('Sales Transactions',RELATED('Customer Data'[State])="Texas"),[Amt]*RELATED('Product Data'[Price ea]))
    
#### AVERAGEX()

   averagex('Table',Expression)
   
#### RANK.EQ

   rank.eq([Column],[Column],1)
   rank.eq([Sales],[Sales],DESC)
   
#### STEDEV.P

   stede.p([Column])
   
### Table Functions

#### FILTER()

Subset of a table. Often used with SUMX()

    filter('Table',[Column]>10)

#### ALL()

Ignore all filters. Create sales total in a table.

    all('Table',[Column])
    
#### SUMMARIZE()

    summarize('Table',GroupBy,Column Name,Expression)
    Summary Table = ('Table A',[Location],"Total Volumne",sum('Table A'[Volume])
    
#### UNION()

    union('Table1','Table2','Table3',...)
    
#### NATURALLEFTOUTJOIN()

    naturalleftouterjoin('Table A','Table B')
    
#### NATURALLEFTINNERJOIN()

    naturalleftinnerjoin('Table A','Table B')
    
#### LOOKUPVALUE()

    lookupvalue(ResultName,SeachName,SearchValue)

### RELATED()

Grab value for a single related column. Calulate related columns with SUMX()

### USERELATIONSHIP()

Temporary relationship just for that measure. Often used with an inactive relationship.

### IF()
 
    if(Expression, True, False)
    if('Customer Data'[Shopping Frequncy] in {"Daily", "Monthly", "Weekly"}, "Frequent Shopper","Infrequent Shopper")
    
### SWITCH()
 
    switch(Expression,Value1,Result1,...,[Else])
    State Grouping = switch('Customer Data'[State],"Texas","Growth Market","New York","Established Market","Deprioritized Market")
    
### IFERROR()

    iferror(if([Column]>0,"Y","N"),"N/A")
    
### REPLACE()

    replace([Column]),1,3,"Yes")
    
### SEARCH()

    search("X",[Column])
    
### LEN()

    len([Column])
    
### FORMAT()

    format([Column],"Scientific")
    
### LEFT(), RIGHT(), MID()

   left([Column],5)
   mid([Column],3,7)
   
### VALUE()

   value([Column])

## Compound Measures
    
    [New Measure] := <Existing measures(s) + additional logic>
    
# Named Variables

    Z Score =
    
    VAR x = sum('Complete Table'[Monthly Sales]),
    
    VAR mu = calculate(
      average('Complete Table'[Monthly Sales]),
        filter(allselected('Complete Table'),
          average('Complete Table'[Monthly Sales])
        )
      )
      
    VAR sigma = 261100
    
    Return
    
    if(
      [Top 10 Net] > 0,
      (x - mu) / sigma,
      ''
    )
    
