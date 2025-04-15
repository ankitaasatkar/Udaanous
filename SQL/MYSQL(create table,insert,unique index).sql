create table drop_idx_tab(studentID int,studentName varchar(255),age int);

insert into drop_idx_tab(studentID,studentName,age)values(1,"ALEX",18),(2,"Akash",27),(3,"Ramisha",21),(4,"Rahul",24);

create unique index idx_unique ON drop_idx_tab(studentID);
select * from drop_idx_tab;

alter table drop_idx_tab drop index idx_unique;

