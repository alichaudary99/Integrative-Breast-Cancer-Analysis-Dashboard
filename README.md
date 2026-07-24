# Integrative Breast Cancer Genomics Analytics Platform 🧬📊
An interactive, enterprise-level Power BI dashboard designed to cross-validate and analyze breast cancer genomics data across TCGA (The Cancer Genome Atlas) and GEO (Gene Expression Omnibus) cohorts. 
This project demonstrates an end-to-end bioinformatics data analysis pipeline, from backend SQL data engineering to frontend interactive data visualization using DAX and UI/UX best practices.

## 🎯 Project Objective
The goal of this platform is to provide an interactive interface for exploring gene expression, evaluating biomarker variance, and stratifying patients based on clinical Z-score outliers without requiring raw database queries.

## 🗄️ Data Engineering & ETL Pipeline (SQL)
Rather than importing raw, messy datasets directly into Power BI, I engineered a robust backend using **7 custom SQL Views** to handle data transformation:
* **Data Integration:** Mapped GEO `Gene_Symbol` to `TCGA_Ensembl_ID` for cross-cohort validation.
* **Data Quality Audit:** Handled missing expression values and ensured pipeline completeness.
* **Mathematical Aggregation:** Calculated Global Average Expressions, Maximum/Minimum Expression thresholds, and Variance metrics natively in SQL.
* **Clinical Classification:** Computed Z-Scores to classify patient samples into *Critical Over-Expression*, *Critical Under-Expression*, and *Normal Range* buckets.

## 📈 Power BI Data Modeling & Analytics
The dashboard was built applying advanced data visualization techniques:

### 1. Dynamic DAX Functionality
* Developed custom DAX measures (e.g., `SELECTEDVALUE`) to create dynamic, responsive chart titles that update instantly based on user slicing.

### 2. Clinical UI/UX Design
* **Modern Interface:** Implemented a clean, light-grey clinical theme with pure white visual cards to reduce cognitive load.
* **Biological Color-Coding:** Applied strict conditional formatting (Red for over-expression, Blue for under-expression) rather than default software palettes.
* **"X-Ray" Tooltips:** Built custom report page tooltips so hovering over high-variance scatter plot data points reveals deeper, secondary insights.
* **Seamless Navigation:** Integrated custom page navigators to easily move between the "Genomic Analytics" view and the "Cohort Overview" data dictionary.

## 🚀 Dashboard Pages
1. **Genomic Analytics:** The primary interactive workspace featuring a gene selection dropdown, patient outlier distribution, biomarker profiling, and high-variance clustering.
2. **Cohort Overview:** A data dictionary page tracking total analyzed records (105M+), sample sizes, and a searchable index proving the validation of gene mappings across the two datasets.

## 🛠️ Tools Used
* **SQL:** Data manipulation, mathematical aggregations, and logic structuring.
* **Power BI:** Relational data modeling, DAX scripting, and interactive visualization.
* **Bioinformatics Concepts:** Z-score normalization, cross-dataset identifier mapping, expression variance analysis.

## 📥 How to View the Project
1. Download the `Integrative_Breast_Cancer_Dashboard.pbix` file from this repository.
2. Open it using Power BI Desktop.
