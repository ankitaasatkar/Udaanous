use database2;

CREATE TABLE purchases (CustomerID INT,PurchaseDate DATE,ReturnDate DATE);
 
INSERT INTO purchases (CustomerID, PurchaseDate, ReturnDate) 
VALUES(1, '2024-01-01', '2024-01-05'),
(2, '2024-01-02', '2024-01-06'),
(3, '2024-01-03', '2024-01-07'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-11'),
(8, '2024-01-08', '2024-01-12'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-14');

select * from purchases;

ALTER TABLE purchases ADD FormattedDate VARCHAR(50);
select * from purchases;

UPDATE purchases
SET FormattedDate = CONCAT(RIGHT(YEAR(PurchaseDate), 2), '-',                   
    DATE_FORMAT(PurchaseDate, '%M'), '-',                  
    DAY(PurchaseDate),                                     
    CASE
        WHEN DAY(PurchaseDate) IN (11, 12, 13) THEN 'th'
        WHEN DAY(PurchaseDate) % 10 = 1 THEN 'st'
        WHEN DAY(PurchaseDate) % 10 = 2 THEN 'nd'
        WHEN DAY(PurchaseDate) % 10 = 3 THEN 'rd'
        ELSE 'th'
    END
)
WHERE CustomerID;
 


SELECT 
    CustomerID,
    PurchaseDate,
    CONCAT(
        DATE_FORMAT(PurchaseDate, '%y'), '-', 
        DATE_FORMAT(PurchaseDate, '%M'), '-', 
        CASE 
            WHEN DAY(PurchaseDate) IN (11,12,13) THEN CONCAT(DAY(PurchaseDate), 'th')
            WHEN DAY(PurchaseDate) % 10 = 1 THEN CONCAT(DAY(PurchaseDate), 'st')
            WHEN DAY(PurchaseDate) % 10 = 2 THEN CONCAT(DAY(PurchaseDate), 'nd')
            WHEN DAY(PurchaseDate) % 10 = 3 THEN CONCAT(DAY(PurchaseDate), 'rd')
            ELSE CONCAT(DAY(PurchaseDate), 'th')
        END
    ) AS FormatedDate
FROM purchases;



