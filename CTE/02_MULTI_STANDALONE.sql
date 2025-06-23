-- ---------------------------------------------STANDALONE CTE---------------------------------------------
-- Defined and used independently. Runs independently as its self-contained and does not rely on other CTE'S or query
--  WORKFLOW | |
--            V
-- DB ==> CTE ==> INTERMEDIATE RESULT ==> MAIN QUERY ==> FINAL RESULT
-- RULE ==> in cte you can not use order by

-- Step 1: Find the total sales per customer
with CTE_TOTAL_SALES AS
(select CustomerID
,sum(Sales) totalsales
from orders
group by CustomerID),
-- Step 2 : Find the last order date for each customer
CTE_LAST_SALE as
(select CustomerID,
max(OrderDate) lastorder
from orders 
group by CustomerID
)
select c.CustomerID,c.FirstName,c.LastName,cts.totalsales,clo.lastorder
 from customers c
left join  CTE_TOTAL_SALES cts
on cts.CustomerID = c.CustomerID
left join CTE_LAST_SALE clo
on clo.CustomerID = c.CustomerID