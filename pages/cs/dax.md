# [DAX (Data Analysis Expressions)](https://docs.microsoft.com/en-us/dax/)

Measures, or calculated columns? Measures are your first choice, because they are lightweight, scalable. You need a calculated column, if there is no key column, or you need another way to group or slice data.

## Implicit Measures

Implicit DAX functions (Applied by right-clicking) can only be used on aggregate columns, which are shown by the "E"-Symbol.

## Quick Measures

Use Quick Measures to learn DAX syntax.

    Colum = TOTALYTD(SUM('Week 1 Sales'[Sales Total]), 'Date'[Date])

## Explicit Measures

### CALCULATE()

    = Calculate(SUM('Table'[Column]),FILTER(1),FILTER(2))
    
    = Calculate(Sum('Sales'[QTY]),'Product'[Category]="Vegetables")
    
    = Calculate(Sum('Sales'[QTY]),All())
    = Calculate(Sum('Sales'[QTY]),All('Product'[Category]))
    
    Total Amount Apples = Calculate(Sum('Sales'[Amount]),'Product'[Commodity]="Apples")
    
    All Sales ever = CALCULATE(SUM('Sales Transactions'[Amt]),ALL())
    Benchmark 2018 = CALCULATE(SUM('Sales Transactions'[Amt]), FILTER('Date','Date'[Year]=2018)). 
    Benchmark TX 2018 = CALCULATE(SUM('Sales Transactions'[Amt]),'Date'[Year]=2018, 'Customer Data'[State]="Texas")

### SUMX()

* Iterates across individual rows
* Sums the output of your function, row by row

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

### ALL()

Ignore all filters. Create sales total in a table.

### FILTER()

Subset of a table. Often used with SUMX()

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
