-- ------------------------------------Advanced JOIN--------------------------------------------------------------------

/* 1 ==>> LEFT ANTI JON */
-- Returns row form left that has no match in right 
-- IN TABLE A AND B == >> output show only unmatching data from table A.
-- HERE table B use only for filtering not for data 
-- It is only use for filtering
 
-- ?? Get all customes Who have not placed any order ??--
 select * from customers as c
 Left join orders as o
 on c.CustomerID=o.CustomerID
 Where o.CustomerID is null;
 
 -- ?? Get all customes Who have placed any order solve it without inner join  ??--
 Select * from customers as c
 left join orders as o 
 on c.CustomerID = o.CustomerID
 where  o.CustomerID is not null;
 -- ----------------------------------------------------------------------------------------------------------------
 /* 2==>> Cross join */
 -- combines Every row from left with every row from right 
 -- all possi=ble combinations- CARTESIAN JOIN
 -- IF TABLEA has 2 row and TABLEB has 3 row the output will be 2x3=6
 -- The order table does not matter 
 -- no condition needed
 
 -- ?? Generate all possible combinitions of customers and orders ??--
 select * from customers
 cross join orders