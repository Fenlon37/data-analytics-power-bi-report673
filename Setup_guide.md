# Power BI Sales Dashboard - Step-by-Step Implementation Guide

> **New to this project?** Start with the [README](README.md) for an overview of what this dashboard does and the insights it provides.

This guide focuses on the technical implementation steps.
This document provides instructions for recreating the Power BI sales analytics dashboard from scratch. Follow these steps in order to ensure proper data integration and functionality.

---

## Table of Contents
1. [Initial Data Setup](#initial-data-setup)
2. [Data Modeling](#data-modeling)
3. [Building Report Pages](#building-report-pages)
4. [Advanced Features](#advanced-features)
5. [SQL Integration](#sql-integration)

---

## Initial Data Setup

### Step 1: Import and Transform Orders Table

**Import Process:**
- Connect to Azure SQL Database (SC1) using Import mode
- Enter database credentials to establish connection

**Data Transformation:**
1. Delete the `Card Number` column to protect customer privacy
2. Split the `Order Date` and `Shipping Date` columns:
   - Use space delimiter to separate into date and time components (SC2)
3. Filter out any rows where `Order Date` is null
4. Rename all columns following Power BI naming conventions:
   - Remove underscores
   - Capitalize each word (SC3)

---

### Step 2: Import and Transform Products Table

**Import Process:**
- Use the **Get Data** option to import `Products.csv`

**Data Transformation:**
1. Remove duplicate rows based on the `product_code` column
2. Rename columns for clarity and consistency

---

### Step 3: Import and Transform Stores Table

**Import Process:**
- Connect to Azure Blob Storage
- Import the Stores table

**Data Transformation:**
1. Use the **Replace Values** tool to ensure consistency in the `Region` column
2. Correct any typos or inconsistent naming
3. Rename columns for clarity

---

### Step 4: Import and Transform Customers Table

**Import Process:**
- Use the **Folder connector** in Power BI to combine multiple CSV files
- This will merge the three regional customer files automatically

**Data Transformation:**
1. Create a new `Full Name` column by concatenating `First Name` and `Last Name`
2. Rename columns for clarity and consistency

---

### Step 5: Create Date Table

**Creation Process:**
1. Generate a continuous date table using DAX
2. Ensure the table spans from the earliest `Order Date` to the year-end containing the latest `Shipping Date`

**Add DAX Columns:**
- Day of Week
- Month Number
- Month Name
- Quarter
- Year
- Start of Year
- Start of Quarter
- Start of Month
- Start of Week

**Finalize:**
- Review the DAX code for creating the table (SC4)
- Mark the table as a date table in Power BI (SC5)

---

## Data Modeling

### Step 6: Establish Data Model Relationships

**Build Star Schema:**
1. Create relationships between all dimension tables and the Orders fact table (SC6)
2. Ensure all relationships are:
   - **One-to-many** (from dimension tables to Orders)
   - **Single-direction filters** pointing toward the Orders table
3. Confirm that `Order Date` is set as the **active relationship** in the Orders-Date connection

---

### Step 7: Create Calculated Columns

**Add Country Column:**
1. Navigate to the Stores table
2. Create a new calculated column called `Country` (SC7)
3. Define the column based on the existing `Country Code` column (SC8)

---

### Step 8: Define Key Measures

**Create Measures Table:**
1. Add a new blank table dedicated to storing measures (SC9)

**Define the Following Measures:**
- Total Orders
- Total Revenue
- Total Profit (SC10)
- Total Customers
- Profit YTD
- Revenue YTD

---

### Step 9: Build Hierarchies

**Create Date Hierarchy:** (SC11)
- Level 1: Start of Year
- Level 2: Start of Quarter
- Level 3: Start of Month
- Level 4: Start of Week

**Create Geography Hierarchy:** (SC12)
- Level 1: World Region
- Level 2: Country
- Level 3: Country Region

**Configure Data Categories:**
- Update the data category for each regional field to properly reflect geographic data (SC13)

---

## Building Report Pages

### Initial Setup: Navigation Sidebar

Before building individual pages, add a navigation sidebar:
1. Insert a thin rectangle shape spanning the full page height on the left side
2. Apply this to all four report pages: **Executive Summary**, **Customer Detail**, **Product Detail**, and **Stores Map** (SC14)

---

### Step 10: Customer Detail Page

**Create Metric Cards:**
1. Add card visuals within shapes (SC15) to display:
   - Unique Customers (SC16)
   - Revenue per Customer (SC17)
2. Drag the `Total Customers` measure into the first card
3. Drag the `Revenue per Customer` measure into the second card
4. Rename the `Total Customers` card title to "Unique Customers"

**Add Donut Charts:**
1. Insert two donut chart visuals (SC18)
2. Configure first chart to show customers by country (SC19)
3. Configure second chart to show customers by product category (SC20)

**Create Customer Trend Line Chart:**
1. Insert a line chart visual (SC21)
2. Configure to show unique customers over time
3. Enable drill-down functionality across the date hierarchy (exclude Start of Week)
4. Add a 10-year projection (SC22)
5. Add a trend line to the chart (SC23, SC24)

**Add Top Customers Table:**
1. Insert a table visual showing the top 20 customers by revenue (SC25)
2. Apply conditional formatting with color gradient data bars (SC26, SC27)

**Create Top Customer Spotlight:**
1. Add card visuals for:
   - Top customer name (SC28)
   - Total orders from top customer
   - Total revenue from top customer (SC29)

**Add Date Slicers:**
1. Insert slicer visuals to enable date range selection (SC30, SC31)
2. Configure to allow analysis across different time periods

---

### Step 11: Executive Summary Page

**Add Key Performance Cards:**
1. Insert cards within shapes to display (SC32):
   - Total Revenue
   - Total Orders
   - Total Profit
2. Format values to an appropriate number of significant figures (SC33)

**Create Revenue Trend Chart:**
1. Add a line chart to show revenue trends over time
2. Enable drill-down across the date hierarchy (SC34)

**Add Product Category Bar Chart:**
1. Insert a bar chart visual (SC35)
2. Configure to show total orders for each product category (SC36)

**Create Revenue Breakdown Donut Charts:**
1. Add two donut charts displaying:
   - Revenue by country
   - Revenue by store type

**Build Quarterly KPIs:**
1. Create KPI visuals (SC37) for:
   - Quarterly change in orders
   - Quarterly change in revenue
   - Quarterly change in profit
2. Set targets to 5% above the previous quarter
3. Apply conditional formatting to color the trend axis based on target progress (SC38)
4. Format revenue and profit callout values to 1 decimal place (SC39)

---

### Step 12: Product Detail Page

**Create Performance Gauges:**
1. Build gauge visuals for quarterly performance in:
   - Orders
   - Revenue
   - Profit
2. Set targets to 10% above current quarter revenue (SC40, SC41)
3. Create a `Revenue Gap` measure to calculate the target discrepancy (SC42)
4. Configure each gauge visual (SC43, SC44)
5. Apply conditional formatting to change text color based on target progress (SC45, SC46)

**Add Filter State Cards:**
1. Insert card visuals to display which filters are active (SC47)
2. Show selected countries and categories

**Create Revenue Area Chart:**
1. Add an area chart visual (SC48)
2. Configure to show revenue trends by product category (SC49, SC50)

**Add Top Products Table:**
1. Insert a table visual showing the top 10 products (SC51)

**Build Profitability Scatter Plot:**
1. Create a scatter plot visual (SC52)
2. Configure to show profitability and sales volume across product categories (SC53)

**Implement Collapsible Filter Panel:**
1. Insert a custom filter button icon (SC54, SC55)
2. Create a rectangle shape to overlay the navigation pane
3. Adjust the selection pane to control visibility (SC56)
4. Add vertical list slicers (SC57) and rename appropriately (SC58)
5. Enable multi-select and select-all options (SC59)
6. Create bookmarks for "Slicer Bar Closed" and "Slicer Bar Open" states
7. Configure bookmarks to hide/show slicers (untick data option) (SC60)
8. Assign button actions to toggle between bookmark states (SC61)

---

### Step 13: Stores Map Page

**Create Map Visual:**
1. Insert a map visual to display store locations (SC62)
2. Enable auto zoom functionality (SC63)
3. Set `Profit YTD` as the field determining bubble size (SC64)

**Add Country Filter:**
1. Insert a tile slicer for country filtering (SC65)
2. Enable multi-select and select-all options (SC66)

**Build Drill-through Page:**
1. Create a new drill-through page for detailed store performance analysis
2. Add multiple visuals to the drill-through page (SC68)
3. Include gauge visuals with 20% growth targets for:
   - Revenue YTD vs. last year (SC69, SC70)
   - Profit YTD vs. last year (SC71)

**Create Custom Tooltip:**
1. Add a new page and set page type to "Tooltip"
2. Create a "Stores Tooltip" gauge visual (SC72)
3. This will display when hovering over bubble icons on the map

---

## Advanced Features

### Step 14: Configure Cross-Filtering Interactions

**Open Edit Interactions Mode:**
1. Navigate to the Format tab in the ribbon
2. Click "Edit Interactions" on the left side (SC73)

**Configure Executive Summary Page:**
- For Product Category bar chart and Top 10 Products table:
  - Disable filtering on all card visuals and KPIs (SC75)

**Configure Customer Detail Page:**
- For Top 20 Customers table:
  - Disable filtering for all other visuals
- For Total Customers by Product Category donut chart:
  - Disable filtering on the Customers line graph
- For Total Customers by Country donut chart:
  - Enable cross-filtering of the Total Customers by Product Category donut chart

**Configure Product Detail Page:**
- For Orders vs. Profitability scatter graph:
  - Disable filtering for all other visuals
- For Top 10 Products table:
  - Disable filtering for all other visuals

---

### Step 15: Add Navigation Buttons

**Design Button Appearance:**
- Use custom icon collection for navigation buttons
- **Default appearance:** White icons
- **Hover appearance:** Cyan icons

**Configure Buttons (Executive Summary Page):**
1. Add four blank buttons to the sidebar
2. For each button, configure the following:

**Default Settings:**
- Apply white icon representing each report page

**Hover Settings:**
- Apply cyan icon representing each report page

**Action Settings:**
- Enable the Action format option
- Set type to "Page Navigation"
- Select the appropriate destination page (SC76)

**Copy to Other Pages:**
1. Group all four configured buttons together
2. Copy and paste the button group to all other report pages (SC77)

---

## SQL Integration

### Step 16: Connect and Query SQL Database

**Import Data from PostgreSQL:**
1. Import data from the PostgreSQL database (SC78, SC79)
2. This allows individual tables with different data types to be displayed (SC80)

**Use Advanced Editor for Custom Queries:**
1. Open the Advanced Editor from the ribbon (SC81)
2. Input SQL commands using the syntax:
   ```
   query = Value.NativeQuery(source, "SQL query")
   ```
3. This enables SQL language use separate from Power BI's default query language (SC82)

**Explore Database Structure:**
1. Print the list of tables in the database
2. Display column names and data types for each table (SC83)

**Run Analysis Queries:**
1. Execute SQL database queries to identify patterns and extract key insights (SC84)
2. Review outputs stored in the following folders:
   - `SQL Table columns`
   - `SQL database queries`
   - `SQL list of tables`

---

## Completion Checklist

Before finalizing your dashboard, verify:
- [ ] All data sources are properly connected and refreshing
- [ ] Star schema relationships are correctly configured
- [ ] All measures are calculating accurately
- [ ] Navigation buttons work on all pages
- [ ] Cross-filtering is configured as specified
- [ ] Drill-through functionality is working
- [ ] Custom tooltips display correctly
- [ ] Bookmarks open and close filter panels
- [ ] All visuals are formatted consistently

---

*Note* For visual reference, consult the screenshots folder throughout the process.
