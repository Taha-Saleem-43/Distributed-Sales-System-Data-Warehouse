# DWH & BI Term Project – Northwind Global Distributors

## Project Summary
This project implements the **complete Business Intelligence lifecycle**, integrating multiple OLTP sources and external files into a centralized **Dimensional Data Warehouse**, followed by **OLAP analysis** and an **interactive Power BI dashboard**.

All tasks defined in the project specification have been **fully implemented and demonstrated**.

---

## Task Completion Overview

### ✅ Task 1: Problem Analysis
- Analyzed **Northwind_Source1** and **Northwind_Source2**
- Identified overlaps, data quality issues, and inconsistencies
- Understood **Sales fact grain**
- Reviewed **DW_Northwind schema**
- Mapped **business keys vs surrogate keys**
- Analyzed external customer gender files and relationships

---

### ✅ Task 2: BPMN Workflow Design
- Designed **Control Flow BPMN** for full ETL pipeline
- Designed **Data Flow BPMN** for:
  - Customers (gender standardization)
  - Employees (city handling)
  - Products (category linkage)
  - Sales (orders + order details)
- BPMN aligned with SSIS implementation

---

### ✅ Task 3: ETL Implementation (SSIS)
- Created **staging tables** for all sources
- Loaded OLTP and external files without transformations
- Implemented transformations:
  - Gender standardization (M/F, 1/0 → Male/Female)
  - Source overlap resolution
  - Data cleansing and integration
- Generated **continuous Time dimension**
  - TimeKey format: `YYYYMMDD`
- Loaded all **dimension tables**
- Loaded **Sales fact table** with calculated SalesAmount
- Respected all **business and surrogate key rules**

---

### ✅ Task 4: SSAS OLAP Cube
- Built OLAP cube from DW_Northwind
- Created dimensions:
  - Customer, Employee, EmployeeCity
  - Product, Category, Supplier, Shipper, Time
- Defined hierarchies:
  - Time (Year → Quarter → Month → Day)
  - Product (Category → Product)
  - Employee Geography (Country → City → Employee)
- Implemented measures:
  - Total Sales, Quantity, Avg Unit Price
  - Avg Discount, Order Count
- Performed OLAP operations:
  - Roll-up, Drill-down, Slice, Dice
- Answered all **analytical questions using cube**
- Captured required screenshots

---

### ✅ Task 5: Power BI Dashboard
- Connected Power BI to SQL Server DW
- Modeled star schema relationships
- Created all mandatory DAX measures
- Developed required visuals:
  - Time-series sales trends
  - Category, product, supplier, shipper analysis
  - Employee and customer analysis
  - Gender-based revenue contribution
  - Top-N products and customers
  - Growth trends and time intelligence
- Implemented advanced analytics:
  - Order processing delay
  - Discount impact analysis
  - High-value order breakdown
  - Quantity heatmap
  - Employee productivity by country

---

## Deliverables
- BPMN Control Flow Diagram
- BPMN Data Flow Diagram
- SSIS Project (ETL packages)
- SSAS Cube with screenshots
- Power BI Dashboard (.pbix)

---

## Conclusion
This project successfully demonstrates a **complete end-to-end BI solution**, covering **ETL design, data warehousing, OLAP analytics, and dashboard-driven insights**, fully satisfying all course requirements.
