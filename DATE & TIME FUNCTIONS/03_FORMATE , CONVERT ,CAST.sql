-- -------------------------------------DATE & TIME FUNCTION ------------------------------------------------------
-- ------- ----------------------------- FORMATE & CASTING  -------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
-- 1 ==> FORMATE :- Formates a date and time values
SELECT 
    OrderID,
    CreationTime,
   FORMAT(CreationTime, 'dd'), -- 01
   FORMAT(CreationTime, 'ddd'),-- wed
   FORMAT(CreationTime, 'dddd'),-- wednesday
   FORMAT(CreationTime, 'M') , -- 01
   FORMAT(CreationTime, 'MM'), -- JAN
   FORMAT(CreationTime, 'MMMM') -- JANUARY
FROM
    orders;
-- ----------------------------------------------------------------------------------------------------------
-- If your column contains '2025/08/11' as a string, first convert it to a DATE, then format it:
SELECT 
    STR_TO_DATE('2025/08/11', '%Y/%m/%d') AS original_date,
    DATE_FORMAT(STR_TO_DATE('2025/08/11', '%Y/%m/%d'), '%Y-%m-%d') AS formatted_date;
-- -----------------------------------------------------------------------------------------------------------------
-- ------------------------------------------- CONVERT FORMATE--------------------------------------------------
-- IN MY SQL SERVER
/*select
convert(int,'123') AS [String to int CONVERT ]
convert(DATE,'2025-08-11') AS [String to DATE CONVERT ]
convert(DATE,CreationTime)  AS [DATETIME to DATE CONVERT ]
convert(VARCHAR,CreationTime,32) AS [USA STD> STYLE:32]-- month-day-year
convert(VARCHAR,CreationTime,34) AS [Europe STD> STYLE:34] -- day-month-year
FROM Orders */
-- -----------------------------------------------------------------------------------------------------------------
-- ------------------------------------------- CAST------------------------------------------------------------------
-- CONVERTS  VALU TO A SPECIFIED DATA TYPE
-- SQL SERVER
/*select
cast('123' AS INT) AS [String to int]
cast(123 AS VARCHAR) AS [INT to STRING]
cast('2025-08-20' AS DATE) AS [String to DATE]
cast('2025-08-20' AS DATETIME) AS [String to DATETIME]
cast(CreationTime AS DATE) AS [DATETIME  to DATE]
FROM Orders*/
-- mysql
SELECT CAST('123' AS SIGNED); -- STRING TO int