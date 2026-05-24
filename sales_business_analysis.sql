/* =========================================================
   SQL & DATA QUERYING PROJECT
   Dataset: Sample Sales Data (Kaggle - AdventureWorks Lite)
   Tool: MySQL Workbench
   Purpose: Business Analysis using SQL
   ========================================================= */

-- =========================================================
-- 1. DATABASE SETUP
-- =========================================================

DROP DATABASE IF EXISTS sales_analysis;

CREATE DATABASE sales_analysis;

USE sales_analysis;

-- =========================================================
-- 2. TABLE CREATION
-- =========================================================

CREATE TABLE IF NOT EXISTS sales_data (
    ORDERNUMBER INT,
    QUANTITYORDERED INT,
    PRICEEACH DECIMAL(10,2),
    ORDERLINENUMBER INT,
    SALES DECIMAL(10,2),
    ORDERDATE VARCHAR(30),
    STATUS VARCHAR(50),
    QTR_ID INT,
    MONTH_ID INT,
    YEAR_ID INT,
    PRODUCTLINE VARCHAR(100),
    MSRP INT,
    PRODUCTCODE VARCHAR(50),
    CUSTOMERNAME VARCHAR(255),
    PHONE VARCHAR(50),
    ADDRESSLINE1 VARCHAR(255),
    ADDRESSLINE2 VARCHAR(255),
    CITY VARCHAR(100),
    STATE VARCHAR(100),
    POSTALCODE VARCHAR(20),
    COUNTRY VARCHAR(100),
    TERRITORY VARCHAR(100),
    CONTACTLASTNAME VARCHAR(100),
    CONTACTFIRSTNAME VARCHAR(100),
    DEALSIZE VARCHAR(50)
);

-- =========================================================
-- 3. DATA CLEANING (DATE CONVERSION)
-- =========================================================
-- Convert ORDERDATE from text to proper DATE format

UPDATE sales_data
SET ORDERDATE = STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i');

SELECT ORDERDATE FROM sales_data LIMIT 20;

-- =========================================================
-- 4. DUPLICATE HANDLING STRATEGY 
-- =========================================================
-- Since dataset may contain duplicates, we remove them logically in analysis
-- using GROUP BY or DISTINCT in queries (no destructive deletion)

-- =========================================================
-- 5. BASIC EXPLORATION QUERIES
-- =========================================================

-- Total records
SELECT COUNT(*) AS total_records
FROM sales_data;

-- View sample data
SELECT *
FROM sales_data
LIMIT 10;

-- Orders by status
SELECT STATUS, COUNT(*) AS total_orders
FROM sales_data
GROUP BY STATUS;

-- =========================================================
-- 6. BUSINESS ANALYSIS (CORE SQL)
-- =========================================================

-- Top customers by revenue (duplicate-safe using SUM + GROUP BY)
SELECT CUSTOMERNAME,
       SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY total_revenue DESC;

-- Top 10 customers
SELECT CUSTOMERNAME,
       SUM(SALES) AS total_spent
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY total_spent DESC
LIMIT 10;

-- Revenue by country
SELECT COUNTRY,
       SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY COUNTRY
ORDER BY total_revenue DESC;

-- Revenue by product line
SELECT PRODUCTLINE,
       SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY total_revenue DESC;

-- Average sales per product line
SELECT PRODUCTLINE,
       AVG(SALES) AS avg_sales
FROM sales_data
GROUP BY PRODUCTLINE;

-- Monthly revenue trend
SELECT YEAR_ID,
       MONTH_ID,
       SUM(SALES) AS monthly_revenue
FROM sales_data
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

-- Deal size contribution
SELECT DEALSIZE,
       SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY DEALSIZE;

-- =========================================================
-- 7. CUSTOMER BEHAVIOR ANALYSIS
-- =========================================================

-- Customers who spent above 50,000
SELECT CUSTOMERNAME,
       SUM(SALES) AS total_purchase
FROM sales_data
GROUP BY CUSTOMERNAME
HAVING SUM(SALES) > 50000;

-- Customers paying above average transaction value
SELECT CUSTOMERNAME,
       SALES
FROM sales_data
WHERE SALES > (SELECT AVG(SALES) FROM sales_data);

-- =========================================================
-- 8. WINDOW FUNCTIONS (ADVANCED SQL)
-- =========================================================

-- Customer ranking by total revenue
SELECT CUSTOMERNAME,
       SUM(SALES) AS total_revenue,
       RANK() OVER (ORDER BY SUM(SALES) DESC) AS customer_rank
FROM sales_data
GROUP BY CUSTOMERNAME;

-- Top sales per country (duplicate-safe ranking)
SELECT *
FROM (
    SELECT ORDERNUMBER,
           CUSTOMERNAME,
           COUNTRY,
           SALES,
           ROW_NUMBER() OVER (
               PARTITION BY COUNTRY
               ORDER BY SALES DESC
           ) AS row_num
    FROM sales_data
) ranked
WHERE row_num = 1;

-- =========================================================
-- 9. PERFORMANCE OPTIMIZATION (INDEXING)
-- =========================================================

-- Index for faster customer analysis
CREATE INDEX idx_customer ON sales_data(CUSTOMERNAME);

-- Index for product analysis
CREATE INDEX idx_productline ON sales_data(PRODUCTLINE);





