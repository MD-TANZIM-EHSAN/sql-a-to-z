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
),
-- Step 3: Rank Customers bsaed on total sales per customer
CTE_rank as(
select CustomerID,totalsales, rank() Over (order by totalsales DESC) customerrank
from CTE_TOTAL_SALES
),
-- step 4: segment customers based on their total sales
CTE_CUSTOMER_SEGMENT as(
select CustomerID,
case when  totalsales > 100 then 'high'
     when  totalsales > 50 then 'medium'
     else 'low'
end CUSTOMERSEGMENT
from CTE_TOTAL_SALES
)
select c.CustomerID,c.FirstName,c.LastName,cts.totalsales,clo.lastorder,cr.customerrank,CUSTOMERSEGMENT
 from customers c
left join  CTE_TOTAL_SALES cts
on cts.CustomerID = c.CustomerID
left join CTE_LAST_SALE clo
on clo.CustomerID = c.CustomerID
left join CTE_rank  cr
on cr.CustomerID = c.CustomerID
left join CTE_CUSTOMER_SEGMENT  ccs
on ccs.CustomerID = c.CustomerID