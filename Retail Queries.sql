CREATE DATABASE retail;
USE retail;
SHOW TABLES;
ALTER TABLE `retail sales profitability and return analysis` RENAME TO retailsales;
SELECT * FROM retailsales LIMIT 10;
ALTER TABLE retailsales RENAME COLUMN `ï»¿Order ID` TO OrderID;
DESCRIBE retailsales;
ALTER TABLE retailsales
DROP COLUMN Returned;

ALTER TABLE retailsales
DROP COLUMN Manager;

-- Total Sales, Profit, Orders
SELECT 
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit,
  COUNT(DISTINCT OrderID) AS total_orders,
  SUM(Quantity) AS total_quantity
FROM retailsales;

-- Profit Margin (business KPI)
SELECT 
  SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM retailsales;

-- Monthly Sales Trend
SELECT 
  Year,
  Month,
  SUM(Sales) AS monthly_sales,
  SUM(Profit) AS monthly_profit
FROM retailsales
GROUP BY Year, Month
ORDER BY Year, Month;

-- Yearly Performance
SELECT 
  Year,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY Year;

-- Category Performance
SELECT 
  Category,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY Category
ORDER BY total_sales DESC;

-- Sub-Category Profitability
SELECT 
  `Sub-Category`,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;

-- Top Products
SELECT 
  `Product Name`,
  SUM(Sales) AS total_sales
FROM retailsales
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Top Customers
SELECT 
  `Customer Name`,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Segment Analysis
SELECT 
  Segment,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY Segment;

-- Region Performance
SELECT 
  Region,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY Region
ORDER BY total_sales DESC;

-- State-wise Performance
SELECT 
  State,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY State
ORDER BY total_sales DESC;

-- Discount vs Profit
SELECT 
  Discount,
  AVG(Profit) AS avg_profit
FROM retailsales
GROUP BY Discount
ORDER BY Discount;

-- High Discount Loss Analysis
SELECT 
  Discount,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY Discount
ORDER BY total_profit ASC;


-- VIEWS QUERIES : 
-- Overall Sales View
CREATE VIEW vw_overall_sales AS
SELECT 
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit,
  COUNT(DISTINCT OrderID) AS total_orders,
  SUM(Quantity) AS total_quantity
FROM retailsales;

-- Monthly Trend View
CREATE VIEW vw_monthly_trend AS
SELECT 
  Year,
  Month,
  SUM(Sales) AS monthly_sales,
  SUM(Profit) AS monthly_profit
FROM retailsales
GROUP BY Year, Month;

-- Category Analysis View
CREATE VIEW vw_category_analysis AS
SELECT 
  Category,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY Category;

-- Product View
CREATE VIEW vw_product_analysis AS
SELECT 
  `Product Name`,
  SUM(Sales) AS total_sales
FROM retailsales
GROUP BY `Product Name`;

-- Customer View
CREATE VIEW vw_customer_analysis AS
SELECT 
  `Customer Name`,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY `Customer Name`;

-- Region View
CREATE VIEW vw_region_analysis AS
SELECT 
  Region,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM retailsales
GROUP BY Region;

-- Discount Impact View
CREATE VIEW vw_discount_analysis AS
SELECT 
  Discount,
  AVG(Profit) AS avg_profit
FROM retailsales
GROUP BY Discount;

-- VERIFICATION:
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';
