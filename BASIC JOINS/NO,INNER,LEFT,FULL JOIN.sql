-- ---------------------------------------JOIN------------------------------------------------------------------------
--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>TYPE OF JOIN>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
/* 1 ==>> NO JOIN */
select * from customers;
select * from orders;
-- --------------------------------------------------------------------------------------------------------------------
/* 2 ==>> INNER JOIN */
-- Return only matching rows from both tables.Only common data.
-- The order of table doest not matter.TableA join TableB and B join A output the same result
-- We uses inner join to RECOMBINED DATA OR FILTERING THE DATA

-- ?? GEt all customers along with their orders,but only for customers who placed an order ?? --
select  c.CustomerID,
        c.FirstName,
        o.OrderID,
        o.Sales
from customers as c
inner join orders as o
ON c.CustomerID = o.CustomerID;
-- ------------------------------------------------------------------------------------------------------------------
/* 3 ==>> LEFT JOIN */
-- Returns All rows from Left and only matching from right
-- The order of table is important

-- ?? GEt all customers along with their orders,including those without orders ?? ---
Select * from customers as c
left join orders as o
on c.CustomerID=o.CustomerID;
-- ------------------------------------------------------------------------------------------------------------------
/* 4 ==>> Full join */
-- Return all row from both tables.
-- The order of table does not matter 

-- ?? Get all Customers and all orders,even if there is no match ??--
/*select * from customers as c
Full join orders as o
on c.CustomerID = o.CustomerID */

-- IN MYSQL full join can not support for this we can solve this in other way--:
select * from customers as c
left join orders as o
on c.CustomerID = o.CustomerID 
union
select * from customers as c
right join orders as o
on c.CustomerID = o.CustomerID 