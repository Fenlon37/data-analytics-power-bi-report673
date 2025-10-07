# Power BI Sales Analytics Dashboard

## Overview
This project demonstrates comprehensive business intelligence capabilities using Microsoft Power BI. It combines data from multiple sources to create an interactive dashboard that analyzes sales performance, customer behavior, and product profitability across different regions and time periods.

### Key Features:

- Multi-source data integration (Azure SQL, CSV files, Blob Storage)
- Interactive visualizations with drill-down capabilities
- Advanced DAX calculations for business metrics
- Star schema data modeling
- Custom navigation and filtering

## Table of Contents
1. [Data Sources](#data-sources)
2. [Dashboard Pages](#dashboard-pages) 
3. [Technical Implementation](#technical-implementation)
4. [Key Insights Available](#key-insights-available)
5. [Screenshots](#screenshots)
6. [License](#license)

## Data Sources
The dashboard integrates data from four primary sources:

| Data Type | Source | Details |
|-----------|--------|---------|
| **Orders** | Azure SQL Database | Transaction records from `orders_powerbi` table |
| **Products** | CSV File | Product catalog from `Products.csv` |
| **Stores** | Azure Blob Storage | Store location and regional information |
| **Customers** | Local CSV Files | Regional customer data (extracted from `Customers.zip`) |

## Dashboard Pages

### 1. Executive Summary
The main overview page providing high-level business metrics at a glance.

**Key Visuals:**
- Total Revenue, Orders, and Profit cards
- Revenue trends over time (line chart)
- Orders by product category (bar chart)
- Revenue breakdown by country and store type (donut charts)
- Quarterly KPIs showing performance against 5% growth targets

### 2. Customer Detail
Deep dive into customer demographics and purchasing patterns.

**Key Visuals:**
- Unique customer count and revenue per customer metrics
- Customer distribution by country and product preference
- Customer growth trends with 10-year forecasting
- Top 20 customers by revenue (with conditional formatting)
- Top customer spotlight showing highest spender details
- Date range slicers for trend analysis

### 3. Product Detail
Comprehensive product performance analysis with advanced filtering.

**Key Visuals:**
- Quarterly performance gauges (Orders, Revenue, Profit) with 10% growth targets
- Revenue trends by product category (area chart)
- Top 10 products table
- Profitability vs. sales volume scatter plot
- Interactive filter toolbar for category and country selection

### 4. Stores Map
Geographic visualization of store performance across regions.

**Key Visuals:**
- Interactive map with bubble sizes representing Profit YTD
- Country filter with tile slicer
- Drill-through functionality to detailed store performance page
- Custom tooltips showing store-specific metrics
- Store performance gauges comparing to 20% YoY growth targets

## Technical Implementation

### Data Preparation
1. **Data Cleaning:** Removed sensitive information (credit card numbers), handled null values, and eliminated duplicates
2. **Transformation:** Standardized column names, split date/time columns, created calculated fields (e.g., Full Name from First Name + Last Name)
3. **Consistency:** Corrected regional naming inconsistencies across datasets

### Data Modeling
- **Schema:** Star schema design with Orders as the fact table
- **Relationships:** One-to-many relationships from dimension tables to Orders
- **Date Table:** Custom DAX-generated continuous date table with hierarchies
- **Calculated Columns:** Added derived fields like Country (from Country Code)

### Key Measures (DAX)
A dedicated Measures Table contains calculations including:
- Total Orders, Total Revenue, Total Profit
- Total Customers, Revenue per Customer
- Year-to-Date metrics (Profit YTD, Revenue YTD)
- Gap analysis measures for target tracking

### Hierarchies
Two main hierarchies enable intuitive drill-down analysis:
- **Date Hierarchy:** Year → Quarter → Month → Week
- **Geography Hierarchy:** World Region → Country → Country Region

### Advanced Features
- **Cross-filtering:** Customized interactions between visuals to prevent unwanted filtering
- **Bookmarks:** Created for toggling filter panel visibility
- **Navigation:** Custom icon buttons with hover effects for seamless page transitions
- **Conditional Formatting:** Dynamic color coding based on performance thresholds
- **Drill-through Pages:** Detailed store analysis accessible from map visual
- **Tooltips:** Custom hover information for enhanced data exploration

## Key Insights Available

Users can answer questions such as:
- What are our quarterly revenue trends and are we meeting growth targets?
- Which product categories drive the most orders and profit?
- Who are our most valuable customers and where are they located?
- How is customer growth trending over time?
- Which stores are underperforming or exceeding expectations?
- What's the relationship between product sales volume and profitability?
- How does performance vary by region and country?

## Screenshots

Visual documentation of the project is available in the `screenshots` folder, including:
- Data model relationships
- All four report pages
- Data transformation steps
- DAX measure definitions
- Interactive features and navigation

A separate document outlines the steps taken to complete the project and references specific screenshots.

## SQL Integration

The project includes SQL database connectivity demonstrating:
- Direct query capabilities using `Value.NativeQuery`
- Table structure analysis (columns, data types)
- Custom SQL queries for pattern identification
- Output files in dedicated SQL folders

## What I Learned

Through this project, I gained experience with:
- **Data Integration:** Connecting and combining multiple data sources with different formats
- **Data Quality:** Identifying and resolving inconsistencies to ensure reliable analysis
- **User Experience:** Designing intuitive navigation and interactive filtering for non-technical users
- **Performance:** Optimizing data models and relationships for responsive dashboards
- **Advanced Features:** Implementing bookmarks, drill-through, and custom tooltips
- **Business Intelligence:** Translating data into actionable insights through effective visualization

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
