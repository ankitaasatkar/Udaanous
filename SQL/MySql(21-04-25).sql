use  database2;
--- create the table ---
CREATE TABLE student_info (
    StudentID INT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50)
);
 

INSERT INTO student_info (StudentID, FirstNames, LastNames) VALUES
(1, 'John', 'Doe'),
(2, 'Alice', 'Smith'),
(3, 'Bob', 'Johnson'),
(4, 'Emily', 'Brown'),
(5, 'Michael', 'Davis'),
(6, 'Sarah', 'Wilson'),
(7, 'David', 'Lee'),
(8, 'Jessica', 'Taylor'),
(9, 'Chris', 'Evans'),
(10, 'Emma', 'Thompson');


-- Create the table--
CREATE TABLE exam_info_4 (
    StudentID INT PRIMARY KEY,
    Subjects VARCHAR(50),
    Scores integer
);

 INSERT INTO exam_info_4 (StudentID, Subjects, Scores) VALUES
(1, 'Math',  80),
(2, 'English',  75),
(3, 'Science',  78),
(4, 'Math',  60),
(5, 'English', 86),
(6, 'Science', 90),
(7, 'Science', 75),
(8, 'English', 75),
(9, 'Math',  55),
(10, 'Math',  67);

select * from student_info;
select * from exam_info_4;

----  filter all the columns of student_info table where StudentID from student_info table equals to that of exam_info table WHERE Scores is greater than 75---

select * from student_info  as s join exam_info_4 as e on s.StudentID = e. StudentID where e.scores > 75;

---  ANY query ---

select * from student_info join exam_info_4 on exam_info_4.StudentID = student_info.StudentID 
where  scores > any(select 3 from exam_info_4 where exam_info_4.StudentID = student_info.StudentID and Scores > 75);





