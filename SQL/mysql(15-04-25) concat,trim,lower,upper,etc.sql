select * from courses;
select * from student;

## LOWER
select lower("Biology");

## LOWER USING ALIAS FUNCTION
SELECT LOWER(Department) AS DP from student;

##UPPER
select upper("wilson");
select upper(Gender) AS G from student;

## CHAR_LENGHT
select char_length("Department") AS lenghtofstring from student;

## TRIM FUNCTION
select trim("Richard")  from student;
select trim("LastName") AS LN from student;

## REPLACE
select replace(new_age,20,25) from student;
SELECT REPLACE(New_Age,24,30) AS NG from student;

## CONCATE
select  concat("Richard",' ',"Wilson") as full_name from student;

