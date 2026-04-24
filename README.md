# Data Cleaning Project

## Overview
This project focuses on cleaning and preparing a raw dataset for analysis using SQL. The goal was to identify and fix common data quality issues such as duplicates, missing values, inconsistent formatting, and incorrect data types.

---

## Data Cleaning Steps Performed

The following transformations were applied:

- Removed duplicate records using window functions/joins/CTEs
- Handled missing values (NULLS) appropriately
- Standardized text formatting
- Converted data types where necessary

---

## Key SQL Concepts Used

- `ROW_NUMBER()` for duplicate detection
- `PARTITION BY` window functions
- `JOIN` for data validation

---

## Dataset

- Source: [(https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/layoffs.csv)](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/layoffs.csv)
- Rows: 2361
- Columns: 9

---

## Results

After cleaning:
- Removed 5 duplicate records
- Standardized 14 inconsistent fields
- Updated 2356 data types
- Improved dataset quality for analysis and visualization

---

## What I Learned

- How to clean messy real-world datasets
- How to use SQL window functions effectively
- Importance of data validation before analysis
- Writing scalable and readable SQL queries
