# Building and Mining Data Warehouse

## 📌 Project Overview
This project focuses on designing, building, and analyzing a Data Warehouse using OLAP techniques. It includes the implementation of ETL pipelines, OLAP cubes, and interactive data visualization.

## 👥 Team
- **Team Size**: 5 members
- **Duration**: December 2024

## 🏗️ Technologies Used
- **SQL Server Integration Services (SSIS)** – ETL process for data extraction, transformation, and loading
- **SQL Server Analysis Services (SSAS)** – OLAP cube deployment for multidimensional analysis
- **MDX (Multidimensional Expressions)** – Querying OLAP cubes for insights
- **Power BI / Tableau** – Interactive dashboards and reports
- **SQL Server** – Data storage and management

## 🚀 Features
- **ETL Pipelines** with **SSIS** to extract, transform, and load data from multiple sources.
- **OLAP Cube Deployment** in **SSAS** for multidimensional analysis.
- **MDX Queries** for advanced analytical reporting.
- **SQL Scripts** for managing data layers (DDS, NDS, Stage, Metadata).

## 🚀 How to Run
### 1. Clone the Repository
```sh
 git clone https://github.com/Badabala/Building-ang-Mining-Data-Warehouse.git
cd Building-ang-Mining-Data-Warehouse
```

### 2. Set Up Database
- Import the provided **SQL scripts** into SQL Server to create and populate the database.
- Ensure that **SQL Server Analysis Services (SSAS)** is enabled.

### 3. Configure ETL Pipelines
- Open **SQL Server Data Tools (SSDT)**.
- Load the provided **SSIS package (.dtsx file)**.
- Execute the package to populate the Data Warehouse.

### 4. Deploy OLAP Cube
- Open **SQL Server Analysis Services (SSAS)**.
- Load the provided **OLAP cube project (.dim file)**.
- Deploy and process the cube.

### 5. Run MDX Queries
- Open **SQL Server Management Studio (SSMS)**.
- Connect to SSAS and run **MDX queries** to analyze the data.

## 📜 Folder Structure
```
Building-ang-Mining-Data-Warehouse/
  │── MDX/ # MDX queries for OLAP analysis
  │── SSIS/ # ETL packages for data extraction, transformation, and loading
  │── SSAS/ # OLAP cubes and multidimensional models
  │── DDS.sql # Script for Data Definition Schema │
  │── NDS_update.sql # Script for updating Normalized Data Schema │
  │── STAGE_TABLE.sql # Script for staging tables │
  │── TH_Metadata.sql # Script for metadata management
  │── README.md # Project documentation
```

## 📌 Notes
- Ensure you have **SQL Server Management Studio (SSMS)** and **SQL Server Data Tools (SSDT)** installed.
- Modify connection strings in **SSIS** and **SSAS** configurations as needed.
