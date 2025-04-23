create database sales_data;
USE sales_data;

SELECT * FROM  sales_data;

---- TOTAL SALES VALUES ------
 ## Calculate the total sales value across all orders ##
 ## quantity * price gives the value per item ##
 
SELECT SUM(quantity * price) as Total_value from sales_data;


-----	MONTHLY SALES TRENDS -------
##	Show total sales value by month ##
##	Format: YYYY-MM, total_sales ##

SELECT 
    date_format(order_date, '%Y-%m') AS S_month,
    SUM(quantity * price) AS total_sales
FROM sales_data
GROUP BY s_month
ORDER BY s_month;

----	TOP 5 PRODUCTS BY SALES VALUES ------
## List the top 5 best-selling products based on total revenue ##

SELECT 
    product_name,
    SUM(quantity * price) AS total_revenue
FROM  sales_data
GROUP BY product_name
ORDER BY total_revenue DESC LIMIT 5;

----	SALES BY REGIONS ---------
##	Show total sales value per region ##

SELECT 
    region,
    SUM(quantity * price) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-----	CUSTOMER PURCHASE FREQUENCY--------
##	Find the number of orders placed by each customer. Return top 10 most frequent buyers ##


SELECT 
  customer_id,
  COUNT(DISTINCT order_id) AS total_orders
FROM sales_data
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;


----- 	CATEGORY-WISE REVENUE CONTRIBUTION -----
##  What percentage of total revenue does each product category contribute  ##

SELECT 
  category,
  ROUND(SUM(quantity * price) * 100.0 / 
        (SELECT SUM(quantity * price) FROM sales_data), 2) AS percentage_of_total_revenue
FROM sales_data
GROUP BY category
ORDER BY percentage_of_total_revenue DESC;



---	REPEAD CUSTOMER RATE ----
##	Calculate how many customers have made more than one purchase ##

SELECT COUNT(*) AS repeat_customers
FROM (
  SELECT customer_id
  FROM sales_data
  GROUP BY customer_id
  HAVING COUNT(DISTINCT order_id) > 1
) AS repeated;






