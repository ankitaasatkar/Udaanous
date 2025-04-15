select * from student;
select * from courses;
select * from employees;
select * from student_data;

## CREATE UNIQUE INDEX
create unique index salary on employees(emp_id);
create unique index student_name on student_data(id);
create unique index new_name on employees(new_name);

## CREATE INDEX
create  index age on employees(age);
create index address on student_data(address);
create index age on student_data(age);
create index Credits on courses(Credits);

## DROP INDEX
alter table student_data drop index address;
alter table courses drop index Credits; 
