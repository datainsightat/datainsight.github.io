# [M-Code](https://docs.microsoft.com/en-us/powerquery-m/)

![Overview](../../imgs/pbi_15.jpg)

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
      
## Text Object

    Text.PadStart(text.From([Month]),2,"0")
    
## Logic

    = each if [Month] >= FYStart
      then [Month] - (FYStart - 1)
      else [Month] + (12 - FYStart * 1)
