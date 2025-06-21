-- -----------------------------------------------SUM--------------------------------------------------------------------
-- FIND the total sales across all order and total sale for each product
select CustomerID,Sales,ProductID,
sum(Sales) over() total_sales,
sum(Sales) over(partition by ProductID) EACH_PRODUCT_SALES
from orders;
-- find the percentage Contribution  of each products sales to the total sales
select OrderID, CustomerID,Sales,ProductID,
sum(Sales) over(),
ROUND(Sales/sum(Sales) over() * 100,2 )
from orders;
select* from orders;
-- -------------------------------------- ANALYTICAL USECASES-----------------------------------------------------
-- FIND OVERALL TOTAL
-- Syntex:- Sum(SALES) OVER() -overview entire data 

-- TOTAL PER Group
-- Syntex:- Sum(Sales) OVER(PARTITION BY product) -- COMPARE  CATEGORY

-- Running Total 
-- Syntex :- SUM(Sales) over(order by MONTH) -- Progress over time

-- Rolling total
-- Syntex : - SUM(Sales) Over(order by MONTH ROWs BETWEEN 2 preceding AND CURRENT ROW ) -- progrs over time in specific fixed window
