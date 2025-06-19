-- -----------------------------------------NULLIF----------------------------------------------------------------
-- The NULLIF(value1, value2) function compares two values:
-- If value1 equals value2, it returns NULL.
-- If value1 does NOT equal value2, it returns value1.

/*| OrderID | Original\_Price | Discount\_Price |
| ------- | --------------- | --------------- |
| 1       | 150             | 50              |
| 2       | 250             | 250             |*/
SELECT 
    OrderID,
    Original_Price,
    Discount_Price,
    NULLIF(Original_Price, Discount_Price) AS Result
FROM 
    Orders
ORDER BY 
    Result IS NOT NULL;  -- NULLs will come first

-- OUTPUT:-
/*| OrderID | Original\_Price | Discount\_Price | Result |
| ------- | --------------- | --------------- | ------ |
| 2       | 250             | 250             | NULL   |
| 1       | 150             | 50              | 150    |*/

/*
| OrderID | Original\_Price | Discount\_Price |
| ------- | --------------- | --------------- |
| 1       | 100             | 80              |
| 2       | 200             | 200             |
| 3       | 150             | 100             |
*/
/* ?? You want to calculate how much discount was given. 
 But if the original price and discount price are the same (no real discount),
 treat it as missing*/
 
 SELECT 
    OrderID,
    Original_Price,
    Discount_Price,
    Original_Price - NULLIF(Original_Price, Discount_Price) AS Discount_Amount
FROM 
    Orders;

-- RESULT 
/*| OrderID | Original\_Price | Discount\_Price | Discount\_Amount |
| ------- | --------------- | --------------- | ---------------- |
| 1       | 100             | 80              | 20               |
| 2       | 200             | 200             | NULL             |
| 3       | 150             | 100             | 50               |
*/
-- -----------------------------------------Handling DIVIDING BY ZERO------------------------------------------------
-- ?? Find  the sales price  fro each order by dividing sales by quantity
select OrderID,Sales,Quantity,
Sales/nullif(Quantity,0) as result
from orders;

-- ------------------------------------------ IS NULL AND IS NOT NULL------------------------------------------------
-- identify the customers who has no score 
select * from customers
where Score is null;
-- List the customer who hae score 
Select * from customers 
where Score is not null ;
-- -----------------------------------------IS NULL USES IN ANTI JOIN---------------------------------------
-- list  all details  for customers who have not  placed any order 
select  c.CustomerID,o.OrderID From customers c
Left join orders o
on c.CustomerID = o.CustomerID 
where o.CustomerID is null;
SELECT DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Employees;


