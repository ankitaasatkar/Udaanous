use database2;

CREATE TABLE DateTable (id INT PRIMARY KEY,start_date DATE,end_date DATE);

INSERT INTO DateTable(id, start_date, end_date) VALUES
(1, '2023-01-01', '2023-01-31'),
(2, '2023-06-01', '2023-06-30'),
(3, '2024-01-01', '2024-01-15'),
(4, '2023-03-01', '2024-03-15'),
(5, '2024-02-01', '2024-04-30');

select * from datetable;

--- DATEDIFF ---
select datediff(start_date,end_date) from datetable;

--- DAY,MONTH,YEAR ---

## start_date
select day(start_date) from datetable;
select month(start_date) from datetable;
select year(start_date) from datetable;
## End_date
select day(end_date) from datetable;
select month(end_date) from datetable;
select year(end_date) from datetable;

--- DATE_FORMAT ---
select date_format(end_date,'%Y') from datetable; 
select date_format(start_date,'%b') from datetable;
select date_format(end_date,'%c') from datetable;
select date_format(end_date,'%M') from datetable;
select date_format(start_date,'%y') from datetable;






