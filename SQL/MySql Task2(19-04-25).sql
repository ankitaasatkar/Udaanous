use db1;

select * from sales;
--- GROUP BY ----
select department, avg(salary) from  sales group by department,'salary';
select * from student;
select year, sum(GPA) from  student group by year,'GPA';

---- ORDER BY -----
select * from sales order by department asc;
select name,department,salary from sales order by salary desc;

--- INNER JOIN ---
select * from customer inner join sales_1;
select * from customer inner join sales_1 on sales_1.customer_id = customer.customer_id;


--- Left JOIN----
select * from sales_1 left join customer on customer.customer_id = sales_1.customer_id;

---- Right JOIN ---
select * from customer Right join  sales_1  on sales_1.customer_id = customer.customer_id;

----  Cross JOIN ----
select * from customer Cross join  sales_1 on sales_1.customer_id = customer.customer_id;

select * from sales_1;
select * from customer;

----- ANY ----
select customer_id,sales,ship_date,quantity from sales_1 where sales>12.96;

--- HAVING----
select * from customer;
select count(GPA) gpa from student group by GPA having sum(GPA);

--- EXISTS----
select * from employees;
select order_id from customer where exists(select order_id from sales_1 where  order_id = 9999);













