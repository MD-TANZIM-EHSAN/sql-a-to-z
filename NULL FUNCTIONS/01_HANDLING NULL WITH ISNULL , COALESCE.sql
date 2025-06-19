-- -------------------------------------NULL FUNCTIONS----------------------------------------------------------
-- NULL ==> NULL MEANS nothing,unknown!
	    --  NULL is not equal to anything !
        -- 	NULL is not zero
        -- NULL is not empty string
        -- NUll is not blank spaces
-- ------------------------------------REPLACES VALUSE----------------------------------------------------------
-- 1 ==>ISNULL() :- REPLACES NULL  with a specific value
-- Syntex : ISNULL ( value ,replacement_value)
-- EXAMPLES: ISNULL (Shipping_Address , 'unknown') -- here unknown is default value 
-- EXAMPLE : ISNULL (Shippin_address , Billing_Address) --
-- ----------------------------------------------------------------------------------
-- 2 == > COALESCE() :- RETURNS THE first non null value from the list 
-- Syntex : COALESCE ( value1 ,value2 , value3)
-- EXAMPLES: COALESCE(Shipping_Address , 'unknown') -- here unknown is default value 
-- EXAMPLE : COALESCE(Shippin_address , Billing_Address) --
-- EXAMPLE : COALESCE(Shippin_address , Billing_Address , 'Unknown') --

-- ----------------------------------HANDLE NULL - DATA AGGREGATION -------------------------------------------------
SET SQL_SAFE_UPDATES = 0;
UPDATE customers 
SET 
    Score = NULL
WHERE
    Score = '';
-- FIND THE AVERAGE SCORES OF THE CUSTOMERS
SELECT CustomerID,
       Score,
       AVG(Score)  over(), -- this output the avg without null 
       -- -------------------
       coalesce(Score,0) as d,
       AVG(coalesce(Score,0))  over()
FROM customers;
-- ----------------------------------HANDLE NULL - MATHMETICAL OPERATIONS --------------------------------------
SET SQL_SAFE_UPDATES = 0;
UPDATE customers 
SET 
    LastName = NULL
WHERE
    LastName = '';

-- ?? Display the full name  of customers in a single field
      -- by  merging their first name and last name
      -- and add 10 bonus point to each customers 
--
SELECT 
    CustomerID,
    FirstName,
    LastName,
    CONCAT(FirstName, COALESCE(LastName, '')) AS FullName,
    coalesce(score,0) + 10 
FROM customers;

-- ----------------------------------HANDLE NULL - Before joinning --------------------------------------
-- TABLE1                   |        TABLE2 
-- --------------------------------------------------------|
-- YEAR |  TYPE | ORDERS    |       YEAR | TYPE | SALE     |
-- --------------------------------------------------------|
-- 2024 |    a  |   30      |       2024 |    a  |   100   |
-- 2025 | null  |   30      |       2025 | NULL  |   100   | 
-- 2025 |    b  |   30      |       2025 |    b  |   100   |
-- 2024 |  null |   30      |       2024 | NULL  |   100   |
-- ------------------------------------------------------
-- For null value after joinning it show two values but the toltal values are 4
select
a.year, a.type,a.orders,b.sales
From  Table1 a
join  Table2 b
on a.year =b.year
and isnull(a.type,'') = isnull(b.type,'');
-- ----------------------------------HANDLE NULL - Before Sorting Data --------------------------------------
-- Sort the customers from lowest to highest score ,
-- with null appearing  last
select CustomerID,Score
 from customers
 order by Case when Score is null then 1 else 0 End ,Score