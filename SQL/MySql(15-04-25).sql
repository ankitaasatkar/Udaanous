select * from enrollment;
select * from employees;

##  NULL
select emp_id from employees where emp_id is null;
select department from employees where department is null;

##  NOT NULL
select salary from employees where salary is not null;
select new_name from employees where new_name is not null;



