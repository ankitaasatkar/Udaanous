select * from employees;
select * from student;

---- MIN
select min(salary) from employees;
select min(age) from employees where age>24;

---- MAX
select max(age) from employees;
select max(GPA) from student where GPA>3.24;
select max(new_age) from student;

---- AVG
select * from employees;
select avg(salary) from employees;
select avg(salary) from employees where emp_id = 2;
select avg(new_age) from student;

---- DIV
select * from employees;
select 50000 div 26;
select salary div 20 from employees;

---- COUNT
select * from employees;
select count(salary) from employees;
select * from courses;
select count(Credits)from courses;

---- SUM
select * from employees;
select sum(salary) from employees;
select * from sales;
select sum(salary) from sales where salary >80000;

---- ABS
select * from sales;
select abs(70000);
select abs(salary) from sales;
select * from student_data;
select abs(age) from student_data;






