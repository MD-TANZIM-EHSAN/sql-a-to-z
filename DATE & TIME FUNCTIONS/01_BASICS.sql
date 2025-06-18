-- -------------------------------------DATE & TIME FUNCTION ------------------------------------------------------
-- BASICS
-- 1 ==> DATE COLUMN FROM TABLE (WE CAN FIND DATA IN COLUMN)
select OrderID,
       OrderDate,
       ShipDate,
       CreationTime
 from orders;
 -- 2==> HARDCODED CONSTANT STRING VALUE 
 select OrderID,
       CreationTime,
       '2025-08-11' AS HARDCODED_DATE -- (NOT INSERT IN OUR DATA BASE,JUST ADD IN QUERY )
 from orders;
  -- 3 ==> GETDATE() FUNCTION 
  -- RETURNS THE CURRENT DATE AND TIME AT THE MOMENT WHEN THE QUERY IS EXECUTED 
   select OrderID,
       CreationTime,
       '2025-08-11' AS HARDCODED_DATE, -- (NOT INSERT IN OUR DATA BASE,JUST ADD IN QUERY )
        now() TODAY -- //FOR MYSQL AND IN SQL SERVER USE GETDATE()//
 from orders;