create database SQL_1;

use sql_1;

select * from customers;
select * from orders;
select * from products;

-----	List all customers and their cities -----
SELECT first_name, last_name, city
FROM Customers;

---------- JOINS ---------
select * from customers inner join orders on customers.customer_id = orders.customer_id;
select * from customers left join orders on customers.customer_id = orders.customer_id;
select * from customers right join  orders on customers.customer_id = orders.customer_id;
select * from customers cross join  orders on customers.customer_id = orders.customer_id;
select * from orders inner join products on orders.product_id = products.product_id;


SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.product_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;

----- 	Display each order with customer full name, product name, and total price (quantity × price) ----

SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name,
    p.product_name,
    o.quantity * p.price AS total_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;


------  FILTER AND DATA --------
-- Show all orders placed in March 2024 -----
    
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2024-03-01' AND '2024-03-31';

---- GROUP BY -----
SELECT p.Product_Name, COUNT(o.Product_ID) AS OrderCount FROM Orders as o JOIN  Products p ON o.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Product_Name;
 
---- RAVENUE ANALYSIS -----
----	Count how many times each product has been ordered ----
SElECT p.Product_Name, SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Orders o JOIN Products p ON o.Product_ID = p.Product_ID GROUP BY p.Product_ID, p.Product_Name;

select * from orders;


---- Top Customer -----
---- Identify the customer who spent the most -----

SELECT 
    CONCAT(C.First_Name, ' ', C.Last_Name) AS CustomerName, 
    SUM(O.Quantity * P.Price) AS TotalSpent
FROM Orders as O 
JOIN 
    Customers C ON O.Customer_ID = C.Customer_ID
JOIN 
    products as P ON P.product_id = O.product_id
GROUP BY 
    C.Customer_ID, C.First_Name, C.Last_Name
ORDER BY 
    TotalSpent DESC
LIMIT 2;


--- Bonus ---
---- Which city has the highest average spending per customer ----

SELECT C.City, AVG(T.TotalSpent) AS Avg_Spending
FROM 
    (SELECT 
         O.Customer_ID, 
         avg(O.Quantity * P.Price) AS TotalSpent
     FROM Orders as O
     JOIN products P ON O.product_ID = P.product_ID
     GROUP BY o.Customer_ID) t
JOIN Customers C ON T.Customer_ID = C.Customer_ID
GROUP BY C.City
ORDER BY Avg_Spending DESC;


SELECT  c.city,
    avg(o.Quantity * p.Price) AS TotalSpent
FROM Orders as o
JOIN  Customers c ON o.Customer_ID = c.Customer_ID
JOIN products as p ON p.product_id = o.product_id GROUP BY c.city
ORDER BY TotalSpent DESC
LIMIT 1;


