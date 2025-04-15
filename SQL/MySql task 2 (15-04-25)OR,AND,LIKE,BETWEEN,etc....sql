select * from student;
select * from enrollment;

## OR
select * from student;
select New_Age,gender from student where New_Age=20 or gender='Female';

## LIMIT
select New_Age from student where New_Age limit 1;

## BEETWEEN
select * from student where new_age between 20 AND 24;

## AND
select Department,new_age from student where Department='Science' AND new_age>20;

## IN
select Year,Department from student where Department IN("Medicine","Arts");

## NOT
select new_age,year from student where not year;

## LIKE
select * from student;
select Department,new_age,gender from student where Department like "Business";


