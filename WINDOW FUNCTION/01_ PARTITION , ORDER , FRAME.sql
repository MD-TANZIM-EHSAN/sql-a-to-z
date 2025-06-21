-- ---------------------------------------- WINDOW FUNCTION ------------------------------------------------------------
-- -------------------------------------------- BASICS------------------------------------------------------------------
/* SQL WINDOW FUNCTIONS
Performs calculations on a subset of data without losing details

Window vs Group By
✅ Window is more powerful & dynamic than Group By.

✅ Data Analysis
→ Advanced → Window
→ Simple → Group By

✅ Use Group By + Window in same query, only if same column used

Components
Window Function + Window Definition OVER

PARTITION BY → Divide Data

ORDER BY → Sort Data

FRAME → Define Subset

Rules
❌ Nesting is not allowed!

✅ Window can be used only in SELECT and ORDER BY

✅ SQL executes window AFTER filtering data using WHERE */

-- DEFINITION :- Perform calculations on a specifik subset of data,without losing the level of details of rows
-- Group by :- Returns a single row for each group 
-- Window funtions :- Returns a result for each row (aggregation  + keep details)

-- ?? _ Find the total sales Across All Orders
select 
sum(Sales) from orders;
-- ?? Find the total sales for each product
select ProductID,
sum(Sales) from orders
group by ProductID;
-- ? Find the total Sales for each product,additionally provide details Such order id & order date
select ProductID,OrderID,OrderDate,
sum(Sales) over( partition by ProductID )from orders;

-- BASIC SYNTEX
/*SELECT 
    column1,
    column2,
    AGGREGATE_FUNCTION() OVER (
        [PARTITION BY column]
        [ORDER BY column]
        [ROWS BETWEEN ...]
    ) AS alias_name
FROM table_name;*/

-- -- ---------------------------------------------PARTITION BY--------------------------------------------------------
-- DEFINITION :- PARTITION BY divides the rows into group,based on the column
-- (1) SUM (SALES) OVER ()
--         |
--         |
--         |
--         V
--  Calculations  is done on entier dataset
-- ? Find the total Sales s across all orders
select ProductID,OrderID,OrderDate,
sum(Sales) over( )from orders;
-- ----------------------------------------------------------------------------------------------------------------
-- (2) SUM (SALES) OVER ( PARTTITION BY PRODUCT)
--         |
--         |
--         |
--         V
-- TOTAL SALES FOR EACH PRODUCT
-- ? Find the total Sales for each product,additionally provide details Such order id & order date
select ProductID,OrderID,OrderDate,
sum(Sales) over( ),
sum(Sales) over( partition by ProductID )from orders;
-- ------------------------------------------------------------------------------------------------------------------
-- (3) SUM (SALES) OVER ( PARTTITION BY PRODUCT , ORDERSTATUS)
--         |
--         |
--         |
--         V
-- TOTAL SALES FOR EACH COMBINATION OF PRODUCT AND ORDERSTATUS
-- ?? FIND the total sales for each combination of product and orderstatus
select ProductID,OrderID,OrderDate,OrderStatus,
sum(Sales) over( partition by ProductID,OrderStatus )from orders;
-- ------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------ORDER BY--------------------------------------------------------------
-- RANK each order based on their sales from highest to lowest 
-- Additionally provide details  such order id,order date 
Select OrderID,OrderDate,Sales,
Rank() OVER(Order by Sales DESC)
 from orders;
 -- -----------------------------------------------------------------------------------------------------------------
 -- ----------------------------------------WINDOW FRAME-------------------------------------------------------------
 -- Defines a subset of rows within each window that is relevant for the calculation
SELECT OrderID,OrderStatus, OrderDate,Sales,
sum(sales) over(partition by OrderStatus order by OrderDate ROWs BETWEEN  CURRENT ROW AND 2 FOLLOWING),
sum(sales) over(partition by OrderStatus order by OrderDate ROWs BETWEEN 2 preceding AND CURRENT ROW ),
sum(sales) over(partition by OrderStatus order by OrderDate ROWS unbounded preceding) -- default if we use order by
from orders;
 -- ------------------------------------------RULE-------------------------------------------------------------------
 -- 1==> Window Funtions can be used only in select and order by clauses
 -- 2==> Nested window Functions is not allowed 
 -- 3==>SQL  executed window function after where Clauses
 -- FIND the total sales for each order status,only for two products 101 and 102
 select CustomerID,OrderStatus,
Sales,ProductID,
SUM(Sales) over(partition by OrderStatus) from orders
WHERE ProductID IN (101,102);
-- Window function use with group by
-- EXAMPLE: -
-- RANK CUSTOMERS BASED ON THEIR TOTAL SALES
select CustomerID,
SUM(Sales),
RANK() over(order by SUM(Sales) DESC) from orders
group by CustomerID;

-- Window function use with ORDER by
-- EXAMPLE: SELECT 
    OrderID,
    CustomerID,
    Sales,

    RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM orders



