# PowerBI Data Analytics Project

## Table of Contents
1. [Objective](#objective)
2. [Data Sources](#data-sources)
3. [Screenshots](#screenshots)
4. [Steps Completed](#steps-completed)
5. [Key Lessons](#key-lessons)
6. [License](#license)

## Objective
Microsoft Power BI is used for analyzing business data from multiple sources, performing data transformations, and creating an interactive, visually coherent dashboard. The project extracts relevant business outcomes through data modelling, DAX calculations, and the report presentation to guide the future business approach.

## Data Sources
The imported tables within the project arise from the following data sources:

**Orders**: Azure SQL Database - *orders_powerbi table.*
**Products**: CSV file - *Products.csv.*
**Stores**: Azure Blob Storage - *Stores table.*
**Customers**: Local folder containing three regional CSV files (extracted from *Customers.zip*).

## Screenshots
Please see screenshots folder for visuals of the data model and report pages. The steps of the project outlined below will be accompanied by corresponding screenshots (SC) from that folder.

## Steps Completed
1. **Orders Table**
Import: Connect to Azure SQL Database (SC1) using Import mode and database credentials.
Data Transformation:
Deleted the *Card Number* column to avoid breach of privacy.
Split *Order Date* and *Shipping Date* columns by space delimeter into date and time components (SC2).
Filtered out rows with null *Order Date* values.
Renamed columns following Power BI naming conventions, removing underscores and capitalising words (SC3).

2. **Products Table**
Import: Imported Products.csv using the Get Data option.
Data Transformation:
Removed duplicates in the product_code column.
Renamed columns for clarity.

3. **Stores Table**
Import: Connected to Azure Blob Storage and imported the Stores table.
Data Transformation:
Used the Replace Values tool to ensure consistency in the Region column and correct any typos.
Renamed columns for clarity.

4. **Customers Table**
Import: Combined and transformed the CSV files using the Folder connector in Power BI.
Data Transformation:
Created a Full Name column by concatenating *First Name* and *Last Name*.
Renamed columns for clarity.

5. **Date Table**
Creation: Generated a continuous date table using DAX, spanning the earliest *Order Date* to the latest *Shipping Date*.
DAX Columns:
Day of Week
Month Number
Month Name
Quarter
Year
Start of Year, Start of Quarter, Start of Month, Start of Week
The code for creating the table is outlined within SC4.
The table was marked as a date table (SC5).

6. **Data Model**
Relationships:
Established relationships to form a star schema.
Ensured one-to-many relationships with single-direction filters towards the orders table from every other table (SC6).
Confirmed that *Order Date* is the active relationship in the Orders-Date relationship.

7. **Creating calculated column**
Created a new column (SC7) in the Stores table called Country defined based on the 'Country Code' column (SC8). 

8. **Defining initial Measures**
Created a Measures Table and defined key measures (SC9) such as:
Total Orders
Total Revenue
Total Profit (SC10)
Total Customers
Profit YTD
Revenue YTD

9. **Hierarchies**
Created hierarchies for date and geography (SC11)
Date Hierarchy: Start of Year > Start of Quarter > Start of Month > Start of Week.
Geography Hierarchy (SC12): World Region > Country > Country Region.
The Data Category of the regions was also altered to reflect the contents (SC13).

#### Report pages
Initially a thin rectangle to reflect the navigation sidebar was added to the left of four report pages of *Executive Summary* *Customer Detail*, *Product Detail* and *Stores Map* (SC14).
10. **Customer Detail**
- Cards created (SC15), within shapes to show the number of Unique Customers and the Revenue per Customer (SC16, SC17). The *Total Customers* and *Revenue per Customer* measures are dragged into the fields of the selected card. The *Total Customers* title was then renamed to Unique Customers.
- Two donut charts (SC18) were created to show the customers by country (SC19) and product category (SC20) respectively.
- A line chart was created (SC21) outlining the number of unique customers across time with drill-down enabled to evaluate across the date hierarchy (Excluding Start of Week). Additionally a 10 year projection (SC22) and a trend line (SC23, SC24) was added to the chart.
- A table outlines the top 20 customers by revenue (SC25) with conditional formatting used for determining the colour gradient of the data bars (SC26, SC27).
- Cards added for the top customer name (SC28); their total orders; and the total revenue obtained from them (SC29).
- Slicers added to enable manipulation of the dates (SC30, SC31).

11. **Executive Summary**
- Cards added within shapes to show the *Total Revenue*, *Total Orders*, and *Total Profit* to an appropriate number of SF (SC32, SC33).
- Line chart added to show revenue trends across the date hierarchy (SC34).
- Bar chart added to show total orders for each product category (SC35, SC36).
- Two donut charts display the revenue for the business by country and store type respectively).
- KPIs created (SC37) to reflect the quarterly change to orders, revenue and profits. The trend axis is coloured according to progress made to current targets (SC38), which were 5% above the previous quarter. The revenue and profits callout value were correct to 1dp (SC39).

12. **Product Detail**
- Gauges were created to demonstrate the quarterly performance for orders, revenue and profit. Targets were created to be 10% above the current quarter revenue (SC40, SC41) and a Revenue Gap measure was created to find the discrepancy (SC42). The guage was then created (SC43, SC44), with conditional formatting used to alter the text colour depending on the progress to the target (SC45, SC46).
- Filter state cards are added to show which if any of the countries (SC47) or categories have been selected for the filter.
- Area chart added to show revenue trends by product category (SC48, SC49, SC50).
- Table added to show the top 10 products (SC51).
- Scatter plot to show the profitability (SC52) and sales volume across each product category (SC53).
- Slicers added to enable filtering of the selection by product category and country, with a bookmark-enabled toolbar. This was done through the insertion of a custom filter button (SC54, SC55) and the creation of a larger rectangle shape over the navigation pane. Then after altering the selection pane (SC56), a vertical list slicer was created (SC57), and named appropriately (SC58), with multi-select and select-all enabled (SC59). Slicer Bar Closed and Open states have been defined based on whether the slicers were visible or not, with the data being unticked (SC60) and each bookmark state being given an action to open or close the slicer bar (SC61).
  
13. **Stores Map**
- Map visual (SC62) inserted to outline store performance, with auto zoom enabled (SC63) and Profit YTD selected as the factor affecting the bubble size (SC64).
- A tile slicer (SC65) is to be utilised for filtering by country with a multi-select and select-all option (SC66).
- A Drillthrough page is added for store performance analysis and a variety of visuals are added with the gauges accompanying a 20% growth target for the revenue and profit YTD compared to last year (SC68. SC69, SC70, SC71).
- A tooltips page type was utilised to add a Stores Tooltip gauge, that will be able to be seen for the respective place when selecting the bubble icons on the map (SC72).

#### Power BI Interactions and Navigation Buttons

The initial goal is to set Cross-Filtering Interactions.
- Open the Edit Interactions view in the Format tab of the ribbon on the left side (SC73).
Apply the following settings:
- Executive Summary Page - Product Category bar chart and Top 10 Products table: Disable filtering on card visuals and KPIs (SC75).
- Customer Detail Page - Top 20 Customers table: Disable filtering for all other visuals.
Total Customers by Product Category Donut Chart: Disable filtering on the Customers line graph.
Total Customers by Country Donut Chart: Enable cross-filtering of the Total Customers by Product Category Donut Chart.
- Product Detail Page - Orders vs. Profitability scatter graph: Disable filtering for all other visuals.
Top 10 Products table: Disable filtering for all other visuals.

**Add Navigation Buttons**
Use the custom icons collection for the navigation buttons:
- Default Appearance - Set to white version of the icons.
- Hover Appearance - Set to cyan version of the icons.
Steps to configure buttons:
- On the Executive Summary Page, add four blank buttons to the sidebar.
For each button:
- Default Settings: Apply white icon representing each report page.
- On Hover Settings: Apply cyan icon representing each report page.
- Enable the Action format option, set the type to Page Navigation, and select the destination page (SC76).
- Copy and group the configured buttons across all report pages (SC77).

## Key Lessons
- Addressed data inconsistencies and ensured model integrity.
- Designed user-friendly, interactive dashboards with advanced filtering and drillthrough capabilities.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
