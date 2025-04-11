select * from student;
select * from employees;
select * from enrollment;

## ALTER QUERY RENAME COLUMN
alter table employees rename column emp_name to new_name;
alter table student rename column Age to New_Age;
alter table enrollment rename column FULL_SEMESTER to Semester;

create table student_data(id int,student_name varchar(100) not null,age int,address varchar(100)not null);
insert into student_data(id,student_name,age,address) values(2,'vina',19,'pune'),(3,'komal',18,'Mubai'),(4,'rajat',19,'Mumbai'),(5,'rakesh',18,'pune');

## ADD CONSTRAINT PRIMARY KEY
alter table student_data add constraint pk_id primary key(id);
select * from employees;

## CREATE TABLE 
create table customer(id int,salary int,department_name varchar(20));

insert into customer(id,salary,department_name) values(1,60000,'HR'),(2,50000,'SALES'),(3,70000,'EMPLOYEE'),(4,50000,'SALES');

select * from customer;
select * from employees;

## ADD CONSTRAINT FOREIGN KEY
alter table customer add constraint Fk_id foreign key (id) references employees(emp_id);
 
 ## ADD COLUMN
alter table student_data add gender varchar(40);
 
## DROP COLUMN
alter table student_data drop column gender;

## DROP PRIMARY KEY
create table user_data(id int primary key,name varchar(20));

alter table user_data drop primary key;









 

























