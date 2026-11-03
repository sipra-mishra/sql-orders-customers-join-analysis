-- Combine the 2018 and 2019 sheets into one clean sales table
DROP TABLE IF EXISTS sales;
CREATE TABLE sales AS
SELECT "Order Date" AS order_date, "Order ID" AS order_id, "Segment" AS segment,
       "Category" AS category, "Sub-Category" AS sub_category, "Product Name" AS product_name,
       CAST("Quantity" AS INTEGER) AS quantity, CAST("Sales" AS REAL) AS sales,
       CAST("Discount" AS REAL) AS discount, CAST("Profit" AS REAL) AS profit
FROM sales_2018_raw
UNION ALL
SELECT "Order Date", "Order ID", "Segment", "Category", "Sub-Category", "Product Name",
       CAST("Quantity" AS INTEGER), CAST("Sales" AS REAL), CAST("Discount" AS REAL), CAST("Profit" AS REAL)
FROM sales_2019_raw;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers AS
SELECT "Order ID" AS order_id, "Customer Name" AS customer_name,
       "City" AS city, "State" AS state, "Region" AS region
FROM customer_details;

-- Check 1: row counts and duplicate order IDs (expect 5898, 5008, 0)
SELECT (SELECT COUNT(*) FROM sales) AS sales_rows,
       (SELECT COUNT(*) FROM customers) AS customer_rows,
       (SELECT COUNT(*) - COUNT(DISTINCT order_id) FROM customers) AS duplicate_order_ids;

-- Check 2: sales lines with no matching customer (expect 0)
SELECT COUNT(*) AS sales_lines_without_customer
FROM sales s LEFT JOIN customers c ON c.order_id = s.order_id
WHERE c.order_id IS NULL;

-- Check 3: date range (expect 2018-01-02 to 2019-12-30)
SELECT MIN(order_date), MAX(order_date) FROM sales;