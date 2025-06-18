-- -------------------------------------DATE & TIME FUNCTION ------------------------------------------------------
-- 1 ===>> -----------------------------PART EXTRACTION  ----------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
-- ------------------------------------PART EXTRACTION TYPES--------------------------------------------------------
-- 1==> DAY: RETURNS THE DAY FROM DATE
-- 2==> MONTH: RETURNS THE MONTH FROM DATE
-- 3==> YEAR: RETURNS THE YEAR  FROM DATE
 -- EXAMPLE:-
 select OrderID,
       CreationTime,
       YEAR(CreationTime) year,
       MONTH(CreationTime) month,
       DAY(CreationTime) day
 from orders; 
-- -------------------------------------------------------------------------------------------------------------------
-- 4==> DATEPART(): Returns a specifik part of a date as a number ($$$SUPPORT sql server$$$)
-- DATEPART(part,date)
-- DATEPART(month,Column_NAME) sql server
-- DATEPART(WEEK,Column_NAME)
-- DATEPART(Quartet,Column_NAME)
-- BUT IN mysql 
select OrderID,
       CreationTime,
       WEEK(CreationTime) AS week_number

 from orders; 
 -- If you want the ISO week number (starts on Monday), use: WEEK(creationtime, 3)
 
 -- To find the quarter of a date in MySQL, use the built-in function:
select OrderID,
       CreationTime,
       quarter(CreationTime) AS quarter_number

 from orders; 
-- ------------------------------------------------------------------------------------------------------------------
-- 5==>DATENAME (PART,COLUMN_NAME) SUPPORT IN SQL SERVER 
select OrderID,
       CreationTime,
       DATENAME(month,CreationTime) AS month_name,
       DATENAME(WEEKDAY,CreationTime) AS month_name
        from orders;
 -- BUT IN MYSQL 
SELECT 
    OrderID, CreationTime, MONTHNAME(CreationTime) AS month_name,
     DAYNAME(CreationTime) AS week_day_name  
FROM
    orders;
-- -------------------------------------------------------------------------------------------------------------------
-- 5 ==> DATETRUNC(PART,COLUMN_NAME) -- FOR SQL SERVER
select OrderID,
       CreationTime,
       DATETRUNC(month,CreationTime) AS month_name  -- BEFORE 2025-01-11 12:34:56
													-- AFTER  2025-01-01 00:00:00   
	   from orders;
-- BUT IN MYSQL
SELECT 
    OrderID,
    CreationTime, 
	DATE_FORMAT(CreationTime, '%Y-01-01') AS DT, -- YEAR
    DATE_FORMAT(CreationTime, '%Y-%m-01'),  -- MONTH
    DATE_FORMAT(CreationTime, '%Y-%m-%d %H:00:00') -- hours
FROM
    orders;
 -- USE CASE:
 /*When the date column contains minutes, seconds, and hours, and we want to count the total orders, 
 the output will be based on those time parts(minute, second, hour).
 So, we use DATETRUNC() to remove the minute and second portions*/
 
 -- SOLUTION
 SELECT 
    DATE(CreationTime) AS order_date,  -- removes hour, min, sec
    DATE_FORMAT(CreationTime, '%Y-01-01') AS DT, -- removes month and day
    DATE_FORMAT(CreationTime, '%Y-%m-01'),  -- removes day
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE(CreationTime);

-- -------------------------------------------------------------------------------------------------------------------
-- 6 ==> EOMONTH() -Returns the last day of a month
-- sql server
SELECT 
    CreationTime,
    EOMONTH(CreationTime) AS end_of_month
FROM orders;
-- MYSQL
SELECT 
    CreationTime,
    LAST_DAY(CreationTime) AS end_of_month
FROM orders;