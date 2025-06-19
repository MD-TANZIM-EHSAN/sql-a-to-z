-- -------------------------------------DATE & TIME FUNCTION ------------------------------------------------------
-- ------- -----------------------------DATE CALCULATIONS-------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
-- 1 ==> DATEADD()-FUNCTION- :- ADD OR SUBSTRACT A SPECIFIC TIME INTERVAL TO/ FROM A DATE																				
-- syntex ==> DATEADD(PART,INTERVAL,DATE)
-- EXAMPLES ==> DATEADD(YEAR , 2 , OrderDate)
-- EXAMPLES ==> DATEADD(month , -4, OrderDate)
-- IN SQL SERVER
-- 1. Add 10 days:
SELECT DATEADD(DAY, 10, '2025-08-11') AS result;
-- Output:2025-08-21
-- 2. Subtract 2 months:
SELECT DATEADD(MONTH, -2, '2025-08-11') AS result;
-- Output:2025-06-11
-- 3. Add 1 year:
SELECT DATEADD(YEAR, 1, '2025-08-11') AS result;
-- Output:2026-08-11
-- 4. Add 5 hours:
SELECT DATEADD(HOUR, 5, '2025-08-11 08:00:00') AS result;
-- Output:2025-08-11 13:00:00
-- -----------------------------------------------------------------------------------------------------------------
-- IN MYSQL DATEAD() DOEST NOT SUPPORT
SELECT DATE_ADD('2025-08-11', INTERVAL 2 MONTH) AS plus_two_months;
SELECT DATE_ADD('2025-08-11', INTERVAL -1 YEAR) AS minus_one_year;
-- TO FIND LAST DATE OF SALE
SELECT MAX(sale_date) AS last_sale_date
FROM sales;
-- ----------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
-- 2 ==> DATEDIFF()-FUNCTION- FInd the difference between two dates
-- Syntex ==> DATEDIFF(part,start_date,end_date)
-- Examples ==> DATEDIFF(year ,orderdate, shipping date)
-- sql server
-- ?? FIND  the age of your emloyess ??
SELECT DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Employees;

-- ?? FIND the avg shipping duration in daysfor each month 
select 
Month(OrderID),
AVG(DATEDIFF(day,OrderDate,ShippingDate))
from orders
group by Month(OrderID);

-- Time gap analysis
--  find the number of days between each order and the previous order
-- Time Gap Analysis
-- Find the number of days between each order and the previous order

SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders;
-- ----------------------------------------------------------------------------------------------------------------
-- MYSQL
SELECT 
    TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS age
FROM employees;
/*BirthDate: your column with the birthdate
CURDATE(): today’s date (without time)
YEAR: difference in years*/
-- ?? FIND the avg shipping duration in day for each month 
SELECT 
    MONTH(OrderDate) AS OrderMonth,
    AVG(TIMESTAMPDIFF(day, OrderDate,ShipDate)) AS AvgShippingDuration
FROM orders
GROUP BY MONTH(OrderDate);
-- -------------------------------------------VALIDATION-------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------
--  ISDATE() in SQL Server:
-- Checks if a value can be converted to a date:
SELECT ISDATE('2025-06-18') ; -- Returns 1 (valid);
SELECT ISDATE('invalid date'); -- Returns 0 (invalid)

SELECT
    OrderDate,
    ISDATE(OrderDate),
    CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
    ELSE '9999-01-01'
    END NewOrderDate
FROM
(
    SELECT '2025-08-20' AS OrderDate UNION
    SELECT '2025-08-21' UNION
    SELECT '2025-08-23' UNION
    SELECT '2025-08'
)t;
-- where isdate(orderdate)= 0 
/*Explanation:
This query checks whether each OrderDate string is a valid date using ISDATE().
If it is a valid date (ISDATE(OrderDate) = 1), it casts the string to a proper DATE type using CAST(... AS DATE).
If not valid, it returns NULL (as seen for '2025-08').*/

--  Example workaround in MySQL:
SELECT
    your_column,
    STR_TO_DATE(your_column, '%Y-%m-%d') IS NOT NULL AS is_valid_date
FROM your_table;
