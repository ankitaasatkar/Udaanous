create database database3;
use database3;

select * from customers;
select * from orders;

-----	Join the customers and orders tables using customer_id.
-----	Filter orders to only include those made in the last 12 months (from the current date).
-----   Group and aggregate the data to calculate the total spending and number of orders per customer.
-----	Filter out customers with 3 or fewer orders in the last year.
-----	Use a ranking function (like ROW_NUMBER() or RANK()) to select the top 3 customers per region based on total spending.

SELECT * FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;

WITH ranked AS (
  SELECT c.name, c.region,
  COUNT(*) AS order_count,
  SUM(o.total_amount) AS total_spending,
  RANK() OVER (PARTITION BY c.region ORDER BY SUM(o.total_amount) DESC) AS rnk
  FROM orders o
  JOIN customers c ON o.customer_id = c.customer_id
  WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
  GROUP BY c.customer_id, c.name, c.region
  HAVING order_count > 3)

SELECT name, 
region, 
SUM(total_amount) 
AS total_spending_rank, 
COUNT(*) 
AS order_count FROM orders o
JOIN 
customers c ON o.customer_id = c.customer_id
WHERE
 o.order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY 
o.customer_id, name, region
HAVING  
order_count > 3
ORDER BY
region, total_spending_rank DESC limit 5;











