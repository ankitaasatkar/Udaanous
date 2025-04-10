create table employees(
emp_id int primary key auto_increment,
emp_name varchar(50),
salary decimal(10.2),
department varchar(100),
age int

);
insert into employees(emp_id,emp_name,salary,department,age)values(1,'rakesh',50000.00,'HR',26);
insert into employees(emp_id,emp_name,salary,department,age)values(2,'minakshi',60000.00,'SALES',28);
insert into employees(emp_id,emp_name,salary,department,age)values(3,'Rajat',80000.00,'EMPLOYEE',29);
insert into employees(emp_id,emp_name,salary,department,age)values(4,'sakshi',50000.00,'SALES',30);
insert into employees(emp_id,emp_name,salary,department,age)values(5,'pankaj',90000.00,'HR',20);
insert into employees(emp_id,emp_name,salary,department,age)values(6,'sonali',80000.00,'FINENCE',20);

select * from employees;

## DELETE 
delete from employees where emp_id=6;

## UPDATE
update employees set emp_name='kunal' where emp_id=5;
update employees set department='FINENCE',salary='70000' where emp_id=5;

## CHECK 
select * from employees where department = 'SALES';
select emp_name,salary,age,department from employees where salary >50000;

##  unique & not null
create table customer_user1(
cust_id int primary key unique,
cust_name varchar(20) not null,
email_id varchar(20) not null
);
insert into customer_user1(cust_id,cust_name,email_id) values(105,'rahul','rahul12@gamil.com');

select * from customer_user1;

## TRUNCATE
truncate table employees;

## DROP TABLE
drop table customer;






















