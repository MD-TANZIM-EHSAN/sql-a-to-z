-- ---------------------------------------------------------------------------------------------------------------
-- LEAD ==> Access a value from the next row within a window
--  LAG ==> Access a value from the previous row within a window

-- Analyze the month-over-month(MoM) performance by finding the percentage change in sales between th current
-- and previous month
select *,
CurrentMonthSale - PreviousMonth mom_change,
((CurrentMonthSale - PreviousMonth)/PreviousMonth *100) mom_percen
FROM(
select 
month(OrderDate) OrderMonth,
SUM(Sales) CurrentMonthSale ,
lag(SUM(Sales)) over(order by month(OrderDate)) PreviousMonth
from orders
group by month(OrderDate)
 )t;
-- --------------------------------------Time gap analysis--------------------------------------------
--  find the number of days between each order and the previous order
  SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    TIMESTAMPDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NOfDays -- ALWAYS PREVIOUS DAY - CURRENT DAY/DATE
FROM Orders;
 -- ----------------------------------------CUSTOMER RETENTION ANALYSIS-------------------------------------------
-- In order to analyze customer loyalty,
-- rank customers based on the average days between their orders
select CustomerID,
avg(DaysUntilNextOrder),
RANK() OVER(ORDER BY ISNULL(AVG(DaysUntilNextOrder)),avg(DaysUntilNextOrder))
FROM(
SELECT
    OrderID,
    CustomerID,
    OrderDate AS CurrentOrder,
    LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder,
   TIMESTAMPDIFF( day, OrderDate,
        LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate)
    ) AS DaysUntilNextOrder
FROM orders
ORDER BY CustomerID, OrderDate
 )t 
 group by CustomerID;

