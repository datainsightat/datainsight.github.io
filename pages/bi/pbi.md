# PowerBI

[Udacity: Data Analysis and Visualization with Microsoft Power BI](https://learn.udacity.com/nanodegrees/nd331)
[Dax Studio](https://daxstudio.org/)
[PowerBI](https://powerbi.microsoft.com/)

Power BI = Power Query + Data Model + Power BI Report

## Power Query

* Multiple data sources
* Change structure without changing the source
* Auto-refresh
* Get data in PowerBI or Excel

## Data Model

* vlookup, xlookup, index-match
* range of calculations you want to apply
* Keys to support relationships

## Power BI Report

* Enable users to explore data
* Avoid versioning of report
* Access to dataset, data flow or data model

# Data Model

## Components

* Dimensions: who, what, where, when, how, why
* Facts: what, how much
  * Additive Facts
  * Semi-Additive Facts
  * Non-Additive Facts: Percentages ...
* Keys: Connect dimensions to facts

## Key Questions

* Key data to calculate?
* How is the data grouped of filtered?
* Where can we access the data?
* Do we need access rights?
* Any sensitive data?
* Can we rely on the data?

# M-Code

Define Source > Navigate to Source Details > Name each change based on last step > Repeat until done

    let
      Source = Your Source Link details
      # Source Info = Your Source Navigation Details
      # Applied Step 1 Name = M Code Action to Source Info
      # Applied Step 2 Name = M Code Action to Result of Applied Step 1,
      # Applied Step 3 Name = M Code Action to Result of Applied Step 2,
      # Applied Step 4 Name = M Code Actoin to Result of Applied Step 3
    in
      # Applied Step 4 Name
      
    let
      Source = Excel.Workbook(File.Contents(L1 - Grocery Store doc.xlsx"),null,true),
      #"Produce Sheet" = Source{[Item="Produce ",Kind="Sheet"]}[Data],
      #"Promoted Headers" = Tabe.PromoteHeaders(#"Produce Sheet","[Promot=true]),
      #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{...}),
      #"Removed Other Columns" = Table.SelectColumns(#"Changed Type",{"PLU",...},
      #"Removed Duplicates" = Table.Distinct(#"Removed Other Columns",{"PLU"})
    in
      #"Removed Duplicates"

# Date Tables

    Calendar(<startdate>,<enddate>)
    CalendarAuto()
      
    



