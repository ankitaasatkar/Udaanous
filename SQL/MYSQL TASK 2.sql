## USE WHERE

select * from student;

select age,department from student where age =18;

select age,department from student where age >21;

select age,gender,department from student where age <23;

select * from enrollment;

select age, gpa department from student where age <=18;

select age, department,gender,gpa from student where gpa <= 3.54;

select age, department,gpa from student where age != 24;

select * from courses;

select * from enrollment;

select * from student;

##AS ALISE

select FULL_SEMESTER AS FS FROM enrollment;

select t1.credits , t2.FULL_SEMESTER , t3.age from enrollment as t2,courses as t1 ,student as t3;

## DISTINCT

SELECT * FROM  enrollment;

select distinct(FULL_SEMESTER) FROM enrollment;

SELECT * FROM STUDENT;

## SELECTING QUERY

select * from enrollment;

SELECT  age, department,gpa,gender from enrollment;










































