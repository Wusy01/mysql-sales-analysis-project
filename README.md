# mysql-sales-analysis-project
Business sales analysis project using MySQL and SQL querying techniques including data cleaning, aggregation, subqueries, window functions, and query optimization.

# SQL Sales Business Analysis Project

## Project Overview
This project focuses on analyzing sales transaction data using MySQL. The objective was to develop practical SQL querying skills for solving real-world business problems such as revenue analysis, customer behavior analysis, and sales trend reporting.

The project demonstrates data cleaning, aggregation, filtering, subqueries, window functions, and query optimization techniques using SQL.

---

# Dataset
---

Dataset Used: Sample Sales Data (AdventureWorks Lite Equivalent)

Source:
https://www.kaggle.com/datasets/kyanyoga/sample-sales-data

---

# Tools Used

- MySQL Workbench
- SQL

---


# Project Objectives

- Extract and transform structured sales data
- Perform business-driven analysis using SQL
- Apply advanced SQL concepts (subqueries and window functions)
- Optimize query performance using indexing
- Generate business insights from transactional data

---


# Database Setup

```sql
DROP DATABASE IF EXISTS sales_analysis;

CREATE DATABASE sales_analysis;

USE sales_analysis;
```

---

# Table Creation

The sales dataset was imported into MySQL and stored in the `sales_data` table with appropriate data types for business analysis.

---

# Data Cleaning

The `ORDERDATE` column was originally imported as VARCHAR and converted into a proper date format using:

```sql
UPDATE sales_data
SET ORDERDATE = STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i');
```
---

# SQL Concepts Applied

## Basic SQL
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
## Aggregate Functions
- SUM()
- AVG()
- COUNT()

## Advanced SQL
- Subqueries
- Window Functions
- ROW_NUMBER()
- RANK()
- PARTITION BY

## Query Optimization
- INDEX creation

---


# Business Analysis Performed

## 1. Top Customers by Revenue
Customer revenue was calculated using aggregation functions and sorted to identify top-performing customers.

### Key Insight
Euro Shopping Channel was identified as the highest revenue-generating customer, contributing over 900,000 in total sales.
## 2. Revenue by Country
Sales were grouped by country to identify top-performing markets.

## Key Insight
USA generated the highest sales revenue, significantly outperforming other countries.

---

## 3. Product Line Performance
Sales were analyzed across product categories to determine the best-performing product lines.

### Key Insight
Classic Cars was the highest-performing product line, generating the largest share of total revenue.

---

## 4. Monthly Revenue Trend
Revenue was analyzed over time using year and month grouping to identify trends.

Customer revenue was calculated using aggregation functions and sorted to identify top-performing customers.

---

## 5. Deal Size Contribution
Sales were grouped by deal size to understand revenue distribution.

### Key Insight
Medium-sized deals contributed the largest share of total revenue.

---

# Customer Behavior Analysis

Customers who spent above average transaction value were identified using subqueries.

### Key Insight
High-value customers were identified based on spending above the overall average sales value.

---

# Customer Behavior Analysis

Customers who spent above average transaction value were identified using subqueries.

### Key Insight
High-value customers were identified based on spending above the overall average sales value.

---

# Advanced SQL Analysis

Customer ranking was performed using window functions to evaluate performance based on total revenue.

---

# Query Optimization

Indexes were created on frequently used columns such as customer name and product line to improve query performance.

---

# Key Findings

- Total records analyzed: 2,823
- USA was the highest revenue-generating country
- Classic Cars was the best-performing product line
- Euro Shopping Channel was the highest revenue-generating customer
- Medium-sized deals generated the highest revenue

---

# Screenshots

Include screenshots of:
- Data cleaning (date conversion)
- Revenue by country query result
- Top 10 customers result
- Monthly revenue trend output
- Window function ranking output
- Index creation queries

---

# Conclusion

This project demonstrates practical SQL skills required for data analysis and business intelligence tasks. It covers data cleaning, aggregation, advanced SQL querying, analytical reporting, and query optimization using MySQL.

