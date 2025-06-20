
-- ---------------------------------------------COUNT-------------------------------------------------------------
-- --------------------------------------------USE CASE-----------------------------------------------------------
-- 1 ==> Overall analysis 
-- ?? Find the total no of orders ?? 
select 
COUNT(*) Total_orders
 from orders;  
 
 -- 2 ==> Category Analysis
 -- ?? 	Find the total number of orders for each customers ?? 
 -- 1st way
 select CustomerID,
 count(*) over(partition by CustomerID)from orders;

-- 2nd way
 select CustomerID,
 count(*)from orders
 group by CustomerID
 order by CustomerID;
 
 -- 3 ==> Quality CHECK :- Identify NULLs
 select COUNT(*),COUNT(LastName) from customers;

-- 4 ==> Quality Check :- Identify duplicats 
-- FIND DUPLICATES WITH COUNT
-- ans 1
select*from
(select OrderID,
count(*) over(partition by OrderID) Check_key
 from ordersarchive )t
 where Check_key > 1 ;
 -- ans 2 
select OrderID,
count(*)  total_count
from ordersarchive 
group by OrderID
having count(*)>1
