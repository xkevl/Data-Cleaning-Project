# Data Cleaning Project

## Overview
This project analyzes global layoff data using SQL to uncover trends across companies, industries, and time. The workflow includes data cleaning, transformation, and exploratory data analysis (EDA) to generate actionable business insights.

---

## Project Structure

/data

- raw data.csv
- cleaned data.csv

/sql

- Data Cleaning.sql
- Exploratory Data Analysis.sql
- screenshots.pdf

---

## Data Cleaning Steps Performed

The following transformations were applied:
- Removed duplicate records
- Handled missing values (NULLS) appropriately
- Standardized text formatting
- Converted data types where necessary

---

## Exploratory Data Analysis

Key Questions Answered:

- What industries experienced the most layoffs?
- Which companies raised the most funding?
- How did layoffs trend over time?
- Which companies had the highest layoffs per year?
- Which companies maximized funding while minimizing layoffs?

---

## Key SQL Concepts Used

- `JOIN` for data validation
- `SUM` and `MAX` for aggregations
- `ROW_NUMBER`, `RANK`, and `DENSE_RANK` for window functions
- `DATE-FORMAT` for time-based analysis
- CTEs

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

After EDA:
- The consumer and retail industry had the most layoffs from 2020-03-11 to 2023-03-06 with 45182 and 43613 layoffs respectively.
- In 2020 Uber, Booking.com, Groupon, and Airbnb were part of the top 5 companies with the most layoffs. COVID made it so transportation, travel, and going outside in general were kept to a minimum.
- In 2023 the technology sector took a massive hit in layoffs with companies like Google, Microsoft, and Amazon being part of the top 5.
- TikTok India, Grover, and N26 were the top 3 companies that maximized profits while keeping layoffs low.

---

## What I Learned

- How to clean messy real-world datasets
- How to use SQL window functions effectively
- Importance of data validation before analysis
- Writing scalable and readable SQL queries
- How to analyze and extract insights to answer business questions
