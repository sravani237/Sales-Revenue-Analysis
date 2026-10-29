-- =====================================================
-- PROJECT: Sales & Revenue Analysis
-- DATABASE: sales_analysis
-- TABLE: sales
-- TOOL: PostgreSQL
-- PURPOSE: Analyze revenue, profit, products,
--          customer segments, discounts, and regions.
-- =====================================================

-- 1. Overall Business KPIs
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS unique_orders,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales;

-- 2. Sales and Profit by Category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- 3. Sales and Profit by Region
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- 4. Profit by Sub-category
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY sub_category
ORDER BY total_profit DESC;

-- 5. Discount Impact
SELECT
    discount,
    COUNT(*) AS order_records,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;

-- 6. Loss-making Products
SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;

-- 7. Sales by Customer Segment
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;

-- 8. Regional Category Performance
SELECT
    region,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY region, category
ORDER BY region, total_sales DESC;