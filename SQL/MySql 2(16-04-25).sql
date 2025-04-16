use database2;

--- EXAM_INFO TABLE----
create table exam_info(StudentID int auto_increment primary key,FirstNames varchar(50),LastNames varchar(50),scores integer);

insert into exam_info(FirstNames,LastNames,scores)values('john','Doe',80),('Alice','Smith',75),('Bob','Johnson',78),('Emily','Brown',60),('Michael','Davis',86),('Sarah','Wilson',90),('David','Lee',75),('Jessica','Taylor',75),('Chris','Evans',55),('Emma','Thompson',67);

select * from exam_info;

alter table exam_info add CubeScores int;

update exam_info set CubeScores  = power(scores, 3) where StudentID;


---  EXAM_INFO_2 TABLE---- 
create table exam_info_2(StudentID INT AUTO_INCREMENT PRIMARY KEY,FirstNames VARCHAR(50),LastNames VARCHAR(50),Scores float);

INSERT INTO exam_info_2 (FirstNames, LastNames, Scores) 
VALUES('John', 'Doe',  80.345544),('Alice', 'Smith',  75.6355),('Bob', 'Johnson',  78.5364565),('Emily', 'Brown',  60.3565),('Michael', 'Davis', 86.5353656),('Sarah', 'Wilson', 90.535464),('David', 'Lee', 75.567765),('Jessica', 'Taylor', 75.34242),
('Chris', 'Evans',  55.09098),('Emma', 'Thompson',  67.34535);

select * from exam_info_2;

alter table exam_info_2 add column transforedscores float; 

update exam_info_2 set transforedscores = sqrt(scores) where StudentID;
 







 

