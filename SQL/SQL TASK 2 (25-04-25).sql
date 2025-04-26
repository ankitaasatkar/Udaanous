
-----	Join the customers and orders tables using customer_id.
-----	Filter orders to only include those made in the last 12 months (from the current date).
-----   Group and aggregate the data to calculate the total spending and number of orders per customer.
-----	Filter out customers with 3 or fewer orders in the last year.
-----	Use a ranking function (like ROW_NUMBER() or RANK()) to select the top 3 customers per region based on total spending.

WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.name,
        c.region,
        SUM(o. total_amount) AS total_spending,
        COUNT(o.order_id) AS number_of_orders
    FROM
        customers c
    JOIN
        orders o ON c.customer_id = o.customer_id
    WHERE
        o.order_date >= CURDATE() - INTERVAL 12 MONTH
    GROUP BY
        c.customer_id, c.region,c.name
    HAVING
        number_of_orders > 3
    order by region ,total_spending limit 5    
       
),
ranked_customers AS (
    SELECT
        customer_id,
        region,
        total_spending,
        number_of_orders,
        Rank() OVER (PARTITION BY region ORDER BY total_spending DESC) AS rnk
    FROM
        customer_orders
)
SELECT
    *
FROM
    ranked_customers
WHERE
    rnk < 3;
