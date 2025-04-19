use database2;

CREATE TABLE purchases2 (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);
 
INSERT INTO purchases2 (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-09'),
(2, '2024-01-02', '2024-01-16'),
(3, '2024-01-03', '2024-01-11'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-21'),
(8, '2024-01-08', '2024-01-29'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-24');

select * from purchases2;

----  Difference between purchases and ReturnDate ----

select *, datediff(ReturnDate,purchaseDate) as Date_Difference from purchases2;

---- Extract the years from the column returnDate ----

select *,year(purchaseDate) as years_date from purchases2;
select *, extract(year from ReturnDate) as ReturnYear from purchases2;




